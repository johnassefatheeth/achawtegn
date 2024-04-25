import 'package:flutter/material.dart';
import 'package:musica/const/colors.dart';

class textfield extends StatelessWidget {
  final  controller;
  final String hintText;
  final bool obsecureText;

  const textfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obsecureText
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
              padding:const EdgeInsets.all(10.0),
              child: TextField(
                controller: controller,
                obscureText: obsecureText,
                decoration: InputDecoration(
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: bgdarkcolor
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey
                    )
                  ),
                  hintText: hintText
                ),
              ),
            );
  }
}