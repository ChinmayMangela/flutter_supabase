import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_supabase/features/ingredient_scanner/data/model/health_analysis_model.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/exceptions/ingredient_scanner_exception_mapper.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

abstract interface class IngredientScannerRemoteDataSource {
  Future<HealthAnalysisModel> scanIngredients(XFile file);
}

class IngredientScannerRemoteDataSourceImpl
    implements IngredientScannerRemoteDataSource {

  const IngredientScannerRemoteDataSourceImpl(this.model);

  final GenerativeModel model;

  static const String _systemPrompt = r'''
Role: You are an expert Clinical Nutritionist and Food Scientist with 20 years of experience in toxicology and metabolic health.
Task: Analyze the provided food packaging image. Your goal is to identify all ingredients and nutritional values to provide a deep health impact analysis.
Output Format: You must respond STRICTLY in JSON format. Do not include any conversational text before or after the JSON.
Data Requirements:
Health Score: Provide a rating (0.0 to 10.0) and a health_description summarizing the overall impact.
Nutritional Facts: Extract the product quantity and quantity_measure. Provide a list called facts containing { "label": "name", "value": "amount" }.
Immediate Health Impact: List exactly 3-4 short-term physiological effects (e.g., Blood Sugar Spike, Dopamine Hit, Dehydration).
Red Flag Ingredients: For every harmful additive (Preservatives, Artificial Colors, High Fructose Corn Syrup, Inflammatory Oils):
State the ingredient_name.
Provide a primary_health_impact in short.
Detail the specific clinical_mechanism and a 4-5 sentence description as detailed_description.
Assign a risk_level (High, Medium, or Low).
AI Deep Analysis: Provide a professional summary of the product's processing level (using the NOVA scale logic) and hidden health risks.
Healthier Alternatives: List 4 specific, healthier food swaps.
JSON Schema Template:
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
''';

  @override
  Future<HealthAnalysisModel> scanIngredients(XFile file) async {
    try {
      final imageBytes = await file.readAsBytes();
      final textPart = TextPart(_systemPrompt);
      final imagePart = DataPart('image/jpeg', imageBytes);
      final content = [
        Content.multi([
          textPart,
          imagePart
        ])
      ];

      final response = await model.generateContent(content, generationConfig: GenerationConfig(
        responseMimeType: 'application/json'
      ));

      final responseText = response.text;

      if (responseText == null || responseText.isEmpty) {
        throw Exception('The model returned an empty response.');
      }

      final cleanJson = responseText
          .replaceFirst(RegExp(r'^```json'), '')
          .replaceFirst(RegExp(r'```$'), '')
          .trim();

      final Map<String, dynamic> data = jsonDecode(cleanJson);

      return HealthAnalysisModel.fromJson(data);


    } on FormatException catch (e) {
      throw IngredientScannerExceptionMapper.mapIngredientParsingException(e);
    } on SocketException catch (e) {
      throw IngredientScannerExceptionMapper.mapSocketException(e);
    } catch (e) {
      throw IngredientScannerExceptionMapper.mapGenericException(e);
    }
  }

}