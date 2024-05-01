import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/constrolers/playerControl.dart';
import 'package:musica/pages/home.dart';
import 'package:on_audio_query/on_audio_query.dart';
// addToPlaylist state full wigdet that create state object
class addToPlaylist extends StatefulWidget {
  final playlistId;
   addToPlaylist({super.key,required this.playlistId});

  @override
  State<addToPlaylist> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<addToPlaylist> {
  final List<int> selectedSongs = [];
  @override
  // build method 
  Widget build(BuildContext context) {
    
    
    var controller = Get.put(playerController());
    return Scaffold(
      appBar: customAppBar(context: context,pagetitle:"add to playlist"),
      body: FutureBuilder<List<SongModel>>(
          future: controller.audioQuery.querySongs(
                        ignoreCase: true,
                        orderType: OrderType.ASC_OR_SMALLER,
                        sortType: null,
                        uriType: UriType.EXTERNAL,
                      ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final songs = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: songs.length,
                      itemBuilder: (context, index) {
                        final song = songs[index];
                        return CheckboxListTile(
                          title: Text('${song.displayNameWOExt}'),
                          subtitle: Text(song.artist!),
                          value: selectedSongs.contains(song.id),
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                selectedSongs.add(song.id);
                              } else {
                                selectedSongs.remove(song.id);
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
                  // floating  action button to manage the state
                  FloatingActionButton(onPressed: () async {
                    if(selectedSongs.length!=0){
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
      
                      for (int audioId in selectedSongs) {
                        await controller.audioQuery.addToPlaylist(widget.playlistId, audioId);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("songs added"),
                                  duration: Duration(seconds: 3),

                                )
                              );
      
                      Navigator.of(context).pop();
                      Get.to(Home());
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("must atleast selsect one song"),
                                  duration: Duration(seconds: 3),

                                )
                              );
                    }
                      
                    },child: Icon(Icons.add),
                    )
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error fetching songs'));
            }
            // Add a loading indicator while waiting for data
            return Center(child: CircularProgressIndicator());
          },
        ),
    );
  }
}