import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MygetxController extends GetxController{


  void changelanguage(var langcd,var cntcd){
    var locale =Locale(langcd,cntcd);
    Get.updateLocale(locale);
  }
}