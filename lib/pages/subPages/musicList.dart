import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/const/colors.dart';
import 'package:musica/constrolers/playerControl.dart';
import 'package:musica/pages/musicPlayer.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlaylistSongs extends StatelessWidget {
  final List<SongModel> songs;
  final String pageName;
  PlaylistSongs({Key? key, required this.songs, this.pageName="" }) : super(key: key);
  
  
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
                                      : GestureDetector(
                                        onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Text('Rename'),
                          onTap: () {
                            // Handle rename option (e.g., navigate to rename screen)
                            Navigator.pop(context);
                            print('Rename option tapped');
                          },
                        ),
                        ListTile(
                          title:const Text('Delete',
                          style: TextStyle(
                            color: Colors.red,
                          ),),
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Delete Song'),
                                  content: Text('Are you sure you want to delete this song?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>{Navigator.pop(context, false)} ,
                                      child: Text('Cancel'),
                                    ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: Text('Delete'),
                                ),
                              ],
                            );})                 
;
                            final file = File(songs[index].uri.toString());
                            print(songs[index].uri);
                              if (await file.exists()) {
                                file.delete();
                                // Update UI or playlist to reflect the deletion (optional)
                                // You might need to refresh the song list after deletion
                              } else {
                                print('Error: File not found');
                              }
                            // deleteSong(songs[index].uri.toString());
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Set as ringtone'),
                          onTap: () {
                            // Handle set as ringtone option
                            Navigator.pop(context);
                            print('Set as ringtone option tapped');
                          },
                        ),
                        ListTile(
                          title: Text('Properties'),
                          onTap: () {
                            // Handle properties option (e.g., show file details)
                            Navigator.pop(context);
                            print('Properties option tapped');
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
                                        child: const Icon(
                                            Icons.menu,
                                            color: whitecolor,
                                            size: 26,
                                          ),
                                      ),
                onTap: () {
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
