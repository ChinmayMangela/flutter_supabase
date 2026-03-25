import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter_supabase/features/ingredient_scanner/data/model/health_analysis_model.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/exceptions/ingredient_scanner_exception_mapper.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image/image.dart' as img;

abstract interface class IngredientScannerRemoteDataSource {
  Future<HealthAnalysisModel> scanIngredients(XFile file);
}

class IngredientScannerRemoteDataSourceImpl
    implements IngredientScannerRemoteDataSource {
  const IngredientScannerRemoteDataSourceImpl(this.model);

  final GenerativeModel model;

  // FINAL SCHEMA
  static final _fullSchema = Schema.object(
    properties: {
      "health_score": Schema.object(
        properties: {
          "rating": Schema.number(),
          "health_description": Schema.string(),
        },
      ),
      "nutritional_facts": Schema.object(
        properties: {
          "product_quantity": Schema.number(),
          "quantity_measure": Schema.string(),
          "facts": Schema.array(
            items: Schema.object(
              properties: {"label": Schema.string(), "value": Schema.string()},
            ),
          ),
        },
      ),
      "immediate_health_impact": Schema.array(
        items: Schema.object(
          properties: {
            "impact_label": Schema.string(),
            "impact_description": Schema.string(),
          },
        ),
      ),
      "red_flag_ingredients": Schema.array(
        items: Schema.object(
          properties: {
            "ingredient_name": Schema.string(),
            "primary_health_impact": Schema.string(),
            "clinical_mechanism": Schema.string(),
            "detailed_description": Schema.string(),
            "risk_level": Schema.string(),
          },
        ),
      ),
      "ai_deep_analysis": Schema.string(),
      "healthier_alternatives": Schema.array(items: Schema.string()),
    },
  );

  String _buildAnalysisPrompt() {
    return '''
You are an expert Clinical Nutritionist and Food Scientist.

TASK:
Analyze the provided nutritional facts and generate a full health report.

Return STRICT JSON in this structure:
{
  "health_score": { "rating": 0.0, "health_description": "" },
   "nutritional_facts": {
    "product_quantity": 0,
    "quantity_measure": "",
    "facts": [ { "label": "", "value": "" } ]
  },
  "immediate_health_impact": [
    { "impact_label": "", "impact_description": "" }
  ],
  "red_flag_ingredients": [
    {
      "ingredient_name": "",
      "primary_health_impact": "",
      "clinical_mechanism": "",
      "detailed_description": "",
      "risk_level": ""
    }
  ],
  "ai_deep_analysis": "",
  "healthier_alternatives": []
}

Rules:
- 3 immediate impacts
- 4 nutrition facts
- max 2 red flags
- short descriptions
- 4 alternatives
- JSON only
''';
  }
  /*
  - immediate_health_impact: EXACTLY 3 items
- nutritional_facts: facts: only returns 4 important facts
- red_flag_ingredients: MAX 2 items
- descriptions: max 20 words
- ai_deep_analysis: max 40 words
- healthier_alternatives: EXACTLY 4 items
- Return ONLY valid JSON
   */

  @override
  Future<HealthAnalysisModel> scanIngredients(XFile file) async {
    try {
      final compressedBytes = await _compressImage(file);
      final prompt = _buildAnalysisPrompt();
      final imagePart = DataPart('image/jpeg', compressedBytes);
      final response = await model.generateContent(
        [
          Content.multi([TextPart(prompt), imagePart]),
        ],
        generationConfig: GenerationConfig(
          responseMimeType: 'application/json',
          // responseSchema: _fullSchema,
        ),
      );

      final textResponse = response.text;

      if (textResponse == null || textResponse.isEmpty) {
        throw Exception("Scanning failed");
      }

      final data = jsonDecode(response.text!);
      return HealthAnalysisModel.fromJson(data);
    } on FormatException catch (e) {
      throw IngredientScannerExceptionMapper.mapIngredientParsingException(e);
    } on SocketException catch (e) {
      throw IngredientScannerExceptionMapper.mapSocketException(e);
    } catch (e) {
      throw IngredientScannerExceptionMapper.mapGenericException(e);
    }
  }

  Future<Uint8List> _compressImage(XFile file) async {
    // STEP 1: Read original image bytes
    final bytes = await file.readAsBytes();

    // STEP 2: Decode image
    final image = img.decodeImage(bytes);
    if (image == null) {
      throw Exception("Invalid image format");
    }

    // STEP 3: Resize image
    final resizedImage = img.copyResize(
      image,
      width: 512,
    );

    // STEP 4: Compress to JPEG
    final compressedList = img.encodeJpg(
      resizedImage,
      quality: 70,
    );

    // STEP 5: Convert List<int> → Uint8List
    final compressedBytes = Uint8List.fromList(compressedList);

    return compressedBytes;
  }
}
