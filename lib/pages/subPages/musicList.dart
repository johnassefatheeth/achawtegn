import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/components/musdicOptions.dart';
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

/// Represents the state of the playlist songs screen.
///
/// This class defines the UI for displaying a list of songs within a playlist.

class _PlaylistSongsState extends State<PlaylistSongs> {

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(playerController());
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: customAppBar(pagetitle: widget.pageName ,context: context),
      body:Column(
        children: [
          // Add button to add songs to the playlist (if applicable)
          widget.playlistId!=-1?ElevatedButton(onPressed: ( ){
          Get.to(addToPlaylist(playlistId: widget.playlistId));
        }, child: Text("add")):SizedBox(height: 0),// Hide button if no playlist
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
                                            : options(song:song,context:context),
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
