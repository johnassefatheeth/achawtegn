import 'package:flutter/material.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/components/textInput.dart';

class createPlaylist extends StatelessWidget {
   
  createPlaylist({super.key});
  @override
  Widget build(BuildContext context) {
    
    // var controller = Get.put(playerController());
    var playlistname=TextEditingController();
    // var toBeAdded=[];
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