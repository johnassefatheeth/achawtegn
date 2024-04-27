import 'package:flutter/material.dart';

TextStyle Ourstyle({double size = 14.0,bool isBoled=false,bool Islight=false}) {
  return TextStyle(
    fontSize: size,
    fontWeight:isBoled?FontWeight.bold:Islight?FontWeight.w100: FontWeight.normal,
  );
}

