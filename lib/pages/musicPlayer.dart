import 'package:flutter/material.dart';
import 'package:musica/const/colors.dart';

class mPlayer extends StatelessWidget {
  const mPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
       
      ), 
      body:Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
              alignment: Alignment.center,
              
              child: const Icon(Icons.music_note_sharp),
              )
              ),
          Expanded(
            child: Container(
              color: whitecolor,)),

        ],
      )
    );
  }
}