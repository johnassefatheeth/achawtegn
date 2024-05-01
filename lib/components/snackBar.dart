import 'package:flutter/material.dart';

SnackBar snakB({required String texContent,required int duration}){ return SnackBar(
                                  content: Text(texContent),
                                  duration: Duration(seconds: duration),

                                );}