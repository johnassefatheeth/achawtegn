import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/const/colors.dart';
import 'package:musica/constrolers/playerControl.dart';
import 'package:musica/pages/musicPlayer.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlaylistSongs extends StatelessWidget {
  final List<SongModel> songs;
  final String pageName;
  const PlaylistSongs({Key? key, required this.songs, this.pageName="" }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(playerController());
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: customAppBar(pagetitle: pageName),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: songs.length,
          itemBuilder: (context, index) {
            final song = songs[index];
            return Container(
              margin: const EdgeInsets.only(top: 5),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                tileColor: bgcolor,
                title: Text(
                  song.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(color: Colors.white), // Adjust style as needed
                ),
                subtitle: Text(
                  song.artist ?? 'Unknown Artist',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Colors.white.withOpacity(0.6)), // Adjust style as needed
                ),
                leading:QueryArtworkWidget(
                                      id: song.id, 
                                      type: ArtworkType.AUDIO,
                                      nullArtworkWidget: const Icon(
                                        Icons.music_note,
                                        color: whitecolor,
                                        size:32
                                      ),
                                      ), 
                trailing: controller.playIndex.value == index && controller.isPLaying.value
                                      ? const Icon(
                                    Icons.play_arrow,
                                    color: whitecolor,
                                    size: 26,
                                  )
                                      : const Icon(
                                    Icons.music_note_outlined,
                                    color: Colors.transparent,
                                    size: 26,
                                  ),
                onTap: () {
                  // Handle tap action (e.g., play the song)
                    Get.to(() => mPlayer(data: songs));
                    controller.playSong(songs[index].uri, index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
