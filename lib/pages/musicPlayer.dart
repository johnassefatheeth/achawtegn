import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/const/colors.dart';
import 'package:musica/const/listTextStyle.dart';
import 'package:musica/constrolers/playerControl.dart';
import 'package:on_audio_query/on_audio_query.dart';

class mPlayer extends StatelessWidget {
  final List<SongModel> data;

  const mPlayer({super.key , required this.data});

  @override
  Widget build(BuildContext context) {

    var controller=Get.put(playerController());

    return Scaffold(
      backgroundColor: bgcolor,
      appBar: customAppBar(pagetitle: "playing"), 
      body:Column(
        children: [
          Obx(()=> Expanded(
              child: Container(
                height: 250,
                width: 250,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration:const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                
                child:QueryArtworkWidget(
                  id: data[controller.playIndex.value].id,
                   type: ArtworkType.AUDIO,
                   artworkHeight: double.infinity,
                   artworkWidth: double.infinity,
                   nullArtworkWidget: const Icon(Icons.music_note_sharp),
                   ),
                )
                ),
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
              child: Obx(()=> Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      data[controller.playIndex.value].displayNameWOExt,
                      style: Ourstyle(),
                    ),
                    Text(
                      data[controller.playIndex.value].artist.toString(),
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
                            min: const Duration(seconds: 0).inSeconds.toDouble(),
                            max:controller.max.value,
                            value: controller.val.value,
                             onChanged: (newValue){
                              controller.changedurationtosec(newValue.toInt());
                              newValue=newValue;
                             }
                             )
                             ),
                        Text(
                        controller.duration.value,
                         style: Ourstyle(),
                         )
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          
                          onPressed: (){
                            controller.playSong(data[controller.playIndex.value].uri, controller.playIndex.value-1);
                          }, 
                          icon: const Icon(
                            Icons.skip_previous_rounded ,
                            size: 40,
                            )
                            ),
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
                        IconButton(onPressed: (){
                                                    controller.playSong(data[controller.playIndex.value].uri, controller.playIndex.value+1);
                
                        }, icon: const Icon(Icons.skip_next_rounded,size: 40))
                      ],
                
                    )
                
                  ],
                ),
              ),
              )
              ),

        ],
      )
    );
  }
}