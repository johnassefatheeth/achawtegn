import 'package:flutter/material.dart';
import 'package:musica/const/listTextStyle.dart';

class InputButton extends StatelessWidget {
  final Function()? onTap; // Callback function to execute when the button is tapped
  final String btnName; // The text displayed on the button

  InputButton({super.key, required this.onTap, required this.btnName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Assign the provided onTap function to the GestureDetector
      child: Container(
        height: 60,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.blue, // Set the background color of the container
        ),
        child: Center(
          child: Text(
            btnName, 
            style: Ourstyle(), // Apply the specified text style (Ourstyle)
          ),
        ),
      ),
    );
  }
}
