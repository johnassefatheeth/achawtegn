import 'package:flutter/material.dart';
import 'package:musica/const/listTextStyle.dart';

class Inputbutton extends StatelessWidget {


  final Function()? onTap;
  final String btnName;
 Inputbutton({super.key, required this.onTap, required this.btnName});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.black
        ),
        child: Center(
          child: Text(
            btnName,
            style: Ourstyle(),
          ),
        ),
      ),
    );
  }
}