import 'package:flutter_supabase/core/utils/safe_json.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/nutritional_facts.dart';

import 'nutritional_fact_model.dart';

class NutritionalFactsModel extends NutritionalFacts {
  const NutritionalFactsModel({
    required super.productQuantity,
    required super.quantityMeasure,
    required super.facts,
  });

  factory NutritionalFactsModel.fromJson(Map<String, dynamic> json) {
    return NutritionalFactsModel(
      productQuantity: SafeJson.toInt(json['product_quantity']),
      quantityMeasure: SafeJson.toStringValue(json['quantity_measure']),
      facts: SafeJson.toList(
        json['facts'],
        (item) => NutritionalFactModel.fromJson(item),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_quantity': productQuantity,
      'quantity_measure': quantityMeasure,
      'facts': facts.map((e) => (e as NutritionalFactModel).toJson()).toList(),
    };
  }
}
