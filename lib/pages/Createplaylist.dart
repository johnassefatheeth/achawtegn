import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musica/components/snackBar.dart';
import 'package:musica/components/textInput.dart';
import 'package:musica/constrolers/playerControl.dart';
import 'package:musica/pages/home.dart';

class SongSelection extends StatefulWidget {

  const SongSelection({Key? key, }) : super(key: key);

  @override
  State<SongSelection> createState() => _SongSelectionState();
}

class _SongSelectionState extends State<SongSelection> {

  var controller = Get.put(playerController());
  
  final TextEditingController playlistNameController = TextEditingController();
  AudioPlayer? player;

  @override
  void dispose() {
    super.dispose();
    player?.dispose();
  }

  Future<void> createPlaylist(String text) async {
     await controller.audioQuery.createPlaylist(text);
     snakB(texContent: "playlist with the name "+text+" created", duration: 2);
     Get.to(Home());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Playlist'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () async {
              await createPlaylist(playlistNameController.text);
              // Handle playlist creation success/failure (optional)
            },
          ),
        ],
      ),
      body:textfield(controller: playlistNameController, hintText: "name of playlist", obsecureText: false) 
    );
  }
}
