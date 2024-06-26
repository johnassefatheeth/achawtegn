import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/components/musdicOptions.dart';
import 'package:musica/const/icon.dart';
import 'package:musica/components/textsty.dart';
import 'package:musica/constrolers/playerControl.dart';
import 'package:musica/pages/musicPlayer.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../const/listTextStyle.dart';


/// Represents a screen displaying search results for songs.
class SearchedSongPage extends StatelessWidget {
  final String songName;

  const SearchedSongPage({
    Key? key,
    required this.songName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var controller = Get.put(playerController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: customAppBar(pagetitle: "result for $songName",context: context),
      body: FutureBuilder<List<SongModel>>(
         // Fetch songs asynchronously based on the search term
                    future: () async {
                      final songs = await controller.audioQuery.querySongs(
                        ignoreCase: true,
                        orderType: OrderType.ASC_OR_SMALLER,
                        sortType: null,
                        uriType: UriType.EXTERNAL,
                      );
                      return searchSongs(songName, songs);
                    }(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.data == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.data!.isEmpty) {
                        return Center(child: Text('no Songs found', style: Ourstyle()));
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: Obx(() => ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  tileColor: Theme.of(context).colorScheme.tertiary,
                                  title:Namess(mxln: 2, text: snapshot.data![index].displayNameWOExt,IsBold: true),
                                  subtitle:Namess(mxln: 1, text: "${snapshot.data![index].artist}") ,
                                  leading:QueryArtworkWidget(
                                      id: snapshot.data![index].id, 
                                      type: ArtworkType.AUDIO,
                                      nullArtworkWidget: musicIcon(),
                                      ),
                                  trailing: controller.musicname.value == snapshot.data![index].displayName && controller.isPLaying.value
                                      ? const Icon(
                                    Icons.play_arrow,
                                    size: 26,
                                  )
                                      : options(song:snapshot.data![index],context:context),
                                  onTap: () {
                                    Get.to(() => mPlayer(data: snapshot.data!));
                                    controller.playSong(snapshot.data![index], index);
                                  },
                                )),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
    );
  }
  /// Searches for songs containing the specified [searchTerm].
  ///
  /// Parameters:
  /// - [searchTerm]: The search term to match against song titles.
  /// - [allSongs]: The list of all available songs.
  ///
  /// Returns:
  /// A filtered list of songs matching the search term.
  Future<List<SongModel>> searchSongs(String searchTerm, List<SongModel> allSongs) async {
  final lowercaseSearchTerm = searchTerm.toLowerCase();
  final results = allSongs.where((song) => song.title.toLowerCase().contains(lowercaseSearchTerm)).toList();
  return results;
}
}
