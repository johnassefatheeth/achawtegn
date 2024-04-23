import 'package:flutter/material.dart';
import 'package:musica/const/colors.dart';
import 'package:musica/const/listTextStyle.dart';

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
              const SizedBox(height: 10),
          Expanded(
            child: Container(
              padding:const EdgeInsets.all( 10),
              alignment: Alignment.center,
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                color: whitecolor,
              ),
              child: Column(
                children: [
                  Text(
                    "music name",
                    style: Ourstyle(),
                  ),
                  Text(
                    "artist name",
                    style: Ourstyle(),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                    "0:0",
                    style: Ourstyle(),
                  ),
                  Slider(value: 0.0, onChanged: new)
                    ],
                  )
                ],
              ),
              )
              ),

        ],
      )
    );
  }
}