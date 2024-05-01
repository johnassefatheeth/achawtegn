import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller class for managing app-level state using GetX.
class MygetxController extends GetxController{


  void changelanguage(var langcd,var cntcd){
    var locale =Locale(langcd,cntcd);
    Get.updateLocale(locale);
  }
}