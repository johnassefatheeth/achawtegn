import 'package:flutter/material.dart';
import 'package:musica/const/listTextStyle.dart';

Text Namess( { int mxln=1,  String text=""}){
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: mxln,
    style:Ourstyle()
  );
}
