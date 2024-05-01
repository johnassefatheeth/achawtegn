import 'package:flutter/material.dart';

/// Creates a custom SnackBar widget with the specified [textContent] and [duration].
///
////// Parameters:
/// - [textContent]: The text content to display in the SnackBar.
/// - [duration]: The duration for which the SnackBar should be visible (in seconds).
/// Returns:
/// A SnackBar widget with the specified properties.
SnackBar snakB({required String texContent,required int duration}){ return SnackBar(
                                  content: Text(texContent),
                                  duration: Duration(seconds: duration),

                                );}