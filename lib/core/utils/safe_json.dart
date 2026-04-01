import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/red_flag_ingredient.dart';

class SafeJson {
  const SafeJson._();

  static double toDouble(dynamic value, {double defaultValue = 0.0}) {
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? defaultValue;
    return defaultValue;
  }

  static String toStringValue(dynamic value, {String defaultValue = 'N/A'}) {
    if (value is String) return value;
    return defaultValue;
  }

  static int toInt(dynamic value, {int defaultValue = 0}) {
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value) ?? defaultValue;
    return defaultValue;
  }

  static List<T>  toList<T>(
    dynamic value,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (value is List) {
      return value
          .whereType<Map<String, dynamic>>()
          .map((item) => fromJson(item))
          .toList();
    }

    if(value is Map<String, dynamic>) {
      return [fromJson(value)];
    }

    return [];
  }


  static RiskLevel fromString(dynamic value, {RiskLevel defaultValue = RiskLevel.unknown}) {
    if(value is String) {
      final v = value.toLowerCase().trim();
      if(v == 'low') return RiskLevel.low;
      if(v == 'medium') return RiskLevel.medium;
      if(v == 'high') return RiskLevel.high;
    }

    if(value == null) return defaultValue;
    return defaultValue;
  }
}
