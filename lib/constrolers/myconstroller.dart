import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller class for managing app-level state using GetX.
class MygetxController extends GetxController{
/// Changes the app's language based on the specified [langcd] and [cntcd].
  ///
  /// Parameters:
  /// - [langcd]: The language code (e.g., 'en' for English, 'am' for Amharic).
  /// - [cntcd]: The country code (e.g., 'US' for United States, 'ET' for Ethiopia).

  void changelanguage(var langcd,var cntcd){
    var locale =Locale(langcd,cntcd);
    Get.updateLocale(locale);
  }
}