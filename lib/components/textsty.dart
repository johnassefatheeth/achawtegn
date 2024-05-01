import 'package:flutter/material.dart';
import 'package:musica/const/listTextStyle.dart';

/// Custom widget for displaying text with optional ellipsis and bold styling.
///
/// Parameters:
/// - [mxln]: The maximum number of lines for the text (default is 1).
/// - [text]: The text content to display.
/// - [IsBold]: Whether the text should be displayed in bold (default is false).
///
/// Returns:
/// A `Text` widget with the specified properties.
Text Namess( { int mxln=1,  String text="",bool IsBold=false}){
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: mxln,
    style:IsBold?Ourstyle(isBoled: true):Ourstyle()
  );
}
