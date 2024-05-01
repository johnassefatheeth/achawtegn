import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/components/textsty.dart';
import 'package:musica/const/icon.dart';
import 'package:musica/const/listTextStyle.dart';
import 'package:musica/constrolers/playerControl.dart';
import 'package:musica/pages/addMusictoPlaylis.dart';
import 'package:musica/pages/musicPlayer.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlaylistSongs extends StatefulWidget {
  final List<SongModel> songs;
  final String pageName;
  final int playlistId;

  PlaylistSongs({Key? key, required this.songs, this.pageName="",this.playlistId=-1}) : super(key: key);

  @override
  State<PlaylistSongs> createState() => _PlaylistSongsState();
}

class _PlaylistSongsState extends State<PlaylistSongs> {

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(playerController());
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: customAppBar(pagetitle: widget.pageName ,context: context),
      body:Column(
        children: [widget.playlistId!=-1?ElevatedButton(onPressed: ( ){
          Get.to(addToPlaylist(playlistId: widget.playlistId));
        }, child: Text("add")):SizedBox(height: 0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:widget.songs.isNotEmpty? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: widget.songs.length,
                itemBuilder: (context, index) {
                  final song = widget.songs[index];
                  return Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: Theme.of(context).colorScheme.tertiary,
                      title:Namess(mxln:2,text:song.title) ,
                      subtitle: Namess(mxln:1,text:song.artist ?? 'Unknown Artist'),
                      leading:QueryArtworkWidget(
                                            id: song.id, 
                                            type: ArtworkType.AUDIO,
                                            nullArtworkWidget:musicIcon(),
                                            ), 
                      trailing: controller.musicname.value == song.displayName && controller.isPLaying.value
                                            ? const Icon(
                                          Icons.play_arrow,
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
                                                                Navigator.pop(context);
                                                              },
                                                            ),
                                                            ListTile(
                                                              title:const Text('Delete',
                                                              style: TextStyle(
                                                                color: Colors.red,
                                                              ),
                                                              ),
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
                                                                final file = File(song.data);
                                                                  if (await file.exists()) {
                                                                    print(song.data);
                                                                    // file.delete();
                                                                    // Update UI or playlist 
                                                                    // refresh the song list after deletion
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
                                                              onTap: () async {
                                                                await showDialog(
                                                                  context: context,
                                                                  builder: (BuildContext context) {
                                                                    return AlertDialog(
                                                                      title: Text('Song Info'),
                                                                      content: Column(
                                                                        children: [
                                                                          Text('title-'+song.displayName),
                                                                          Text('type-'+song.fileExtension),
                                                                          Text('path-'+song.uri.toString()),
                                                                          Text('date added-'+song.dateAdded.toString()),
                                                                          Text('last modified-'+song.dateModified.toString()),
                                                                        ],
                                                                      ),
                                                                      
                                                                );
                                                                }
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              child: const Icon(
                                                  Icons.more_vert,
                                                  size: 26,
                                                ),
                                            ),
                      onTap: () {
                           controller.playSong(song, index);
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context)=>PlaylistSongs(songs: widget.songs,pageName: widget.pageName)
                            )
                          );
                          Get.to(() => mPlayer(data: widget.songs));
                      },
                    ),
                  );
                },
              ):Expanded(child: Center(
                child:Text("no songs in the playlist" ,style: Ourstyle(),)
              )),
            ),
          ),
        ],
      ),
    );
  }
}
