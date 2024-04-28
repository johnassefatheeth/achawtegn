import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musica/constrolers/playerControl.dart';
import 'package:on_audio_query/on_audio_query.dart';  // For AudioPlayer

class SongSelection extends StatefulWidget {

  const SongSelection({Key? key, }) : super(key: key);

  @override
  State<SongSelection> createState() => _SongSelectionState();
}

class _SongSelectionState extends State<SongSelection> {

  var controller = Get.put(playerController());
  final List<String> selectedSongs = [];
  final TextEditingController playlistNameController = TextEditingController();
  AudioPlayer? player;

  @override
  void dispose() {
    super.dispose();
    player?.dispose();
  }

  Future<void> createPlaylist() async {
    // Access songs using await widget.fetchSongs()
    // final songs = await widget.fetchSongs();
    // ... rest of your createPlaylist logic using the fetched songs
  }

  @override
  Widget build(BuildContext context) {
    
    var controller = Get.put(playerController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Playlist'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () async {
              await createPlaylist();
              // Handle playlist creation success/failure (optional)
            },
          ),
        ],
      ),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: playlistNameController,
                    decoration: InputDecoration(
                      labelText: 'Playlist Name',
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: songs.length,
                    itemBuilder: (context, index) {
                      final song = songs[index];
                      return CheckboxListTile(
                        title: Text('${song.displayNameWOExt}'),
                        subtitle: Text(song.artist!),
                        value: selectedSongs.contains(song.id.toString()),
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              selectedSongs.add(song.id.toString());
                            } else {
                              selectedSongs.remove(song.id.toString());
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
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
