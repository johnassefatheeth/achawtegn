import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/const/colors.dart';
import 'package:musica/const/listTextStyle.dart';
import 'package:musica/constrolers/playerControl.dart';
import 'package:on_audio_query/on_audio_query.dart';

class mPlayer extends StatelessWidget {
  final SongModel data;

  const mPlayer({super.key , required this.data});

  @override
  Widget build(BuildContext context) {

    var controller=Get.put(playerController());

    return Scaffold(
      backgroundColor: bgcolor,
      appBar: customAppBar(pagetitle: "playing"), 
      body:Column(
        children: [
          Expanded(
            child: Container(
              height: 250,
              width: 250,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              
              child:QueryArtworkWidget(
                id: data.id,
                 type: ArtworkType.AUDIO,
                 artworkHeight: double.infinity,
                 artworkWidth: double.infinity,
                 nullArtworkWidget: const Icon(Icons.music_note_sharp),
                 ),
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
                    data.displayNameWOExt,
                    style: Ourstyle(),
                  ),
                  Text(
                    data.artist.toString(),
                    style: Ourstyle(),
                  ),
                  const SizedBox(height: 10),
                  Obx(()=> Row(
                      children: [
                        Text(
                      controller.position.value,
                      style: Ourstyle(),
                    ),
                      Expanded(
                        child: Slider(
                          thumbColor: slidecolor,
                          activeColor: slidecolor,
                          inactiveColor: bgcolor,
                          value: 0.0,
                           onChanged: (newValue){}
                           )
                           ),
                      Text(
                      controller.duration.value,
                       style: Ourstyle(),
                       )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.skip_previous_rounded ,size: 40,)),
                      Obx(()=> Transform.scale(
                          scale: 1.5,
                          child: IconButton(
                            onPressed: (
                              
                            ){
                              if(controller.isPLaying.value){
                                controller.audioPlayer.pause();
                                controller.isPLaying(false);
                              }
                              else{
                                controller.audioPlayer.play();
                                controller.isPLaying(true);
                              }
                              }, 
                            icon:controller.isPLaying.value?const Icon(
                              Icons.pause,
                              size: 54):const Icon(
                              Icons.play_arrow_rounded,
                              size: 54),
                              )
                              ),
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.skip_next_rounded,size: 40))
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