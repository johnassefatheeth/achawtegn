import 'package:flutter/material.dart';

/// Creates a custom SnackBar widget with the specified [textContent] and [duration].
///
SnackBar snakB({required String texContent,required int duration}){ return SnackBar(
                                  content: Text(texContent),
                                  duration: Duration(seconds: duration),

                                );}