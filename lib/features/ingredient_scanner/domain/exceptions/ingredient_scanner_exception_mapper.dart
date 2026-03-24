

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/exceptions/nutrition_scanning_exception.dart';

class IngredientScannerExceptionMapper {
  const IngredientScannerExceptionMapper._();

  static IngredientScanException mapIngredientParsingException(FormatException e) {
    debugPrint("Format Exception: ${e.message}");
    return IngredientScanException(e.message, code: 'parsing-failed');
  }

  static IngredientScanException mapSocketException(SocketException e) {
    debugPrint("Network Error: Please connect to the internet: ${e.message}");
    return IngredientScanException(e.message, code: 'network-issue');
  }

  static IngredientScanException mapGenericException(Object e) {
    debugPrint("Generic exception: ${e.toString()}");
    return IngredientScanException(e.toString());
  }
}