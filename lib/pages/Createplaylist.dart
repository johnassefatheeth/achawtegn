import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/components/textInput.dart';
import 'package:musica/constrolers/playerControl.dart';
import 'package:on_audio_query/on_audio_query.dart';

class createPlaylist extends StatelessWidget {
   
  createPlaylist({super.key});
  @override
  Widget build(BuildContext context) {
    
    var controller = Get.put(playerController());
    var playlistname=TextEditingController();
    var toBeAdded=[];
    return  Scaffold(
      appBar: customAppBar(pagetitle: "create New Playlist", context: context),
      body: Column(
        children: [
          textfield(controller: playlistname, hintText: "enter the name of your plalist ", obsecureText: false),

      ],
      ),
    );
  }
}