import 'package:flutter/material.dart';
import 'package:musica/const/listTextStyle.dart';

/// Custom widget for displaying text with optional ellipsis and bold styling.
///

Text Namess( { int mxln=1,  String text="",bool IsBold=false}){
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: mxln,
    style:IsBold?Ourstyle(isBoled: true):Ourstyle()
  );
}
