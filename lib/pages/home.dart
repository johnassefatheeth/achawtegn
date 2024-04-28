import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/components/Drawerlist.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/components/drawerHeader.dart';
import 'package:musica/const/colors.dart';
import 'package:musica/const/icon.dart';
import 'package:musica/components/textsty.dart';
import 'package:musica/constrolers/playerControl.dart';
import 'package:musica/pages/Createplaylist.dart';
import 'package:musica/pages/subPages/musicList.dart';
import 'package:musica/pages/musicPlayer.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../const/listTextStyle.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(playerController());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        appBar: customAppBar(hasAction: true, pagetitle: "music".tr,context: context),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: const Column(
                children: [
                  DrawerHeaderpart(),
                  DrawerList(),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.tertiary,
              child: TabBar(
                indicatorColor: whitecolor,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold, 
                  color: Colors.blue
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
                tabs: [
                  Tab(text: "songs".tr),
                  Tab(text: "playlist".tr),
                  Tab(text: "album".tr),
                  Tab(text: "artists".tr),
                ],
                dividerColor: Colors.black,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FutureBuilder<List<SongModel>>(
                    future: controller.audioQuery.querySongs(
                      ignoreCase: true,
                      orderType: OrderType.ASC_OR_SMALLER,
                      sortType: null,
                      uriType: UriType.EXTERNAL,
                    ),
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
                                      : const Icon(
                                    Icons.more_vert,
                                    size: 26,
                                  ),
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
                  FutureBuilder<List<PlaylistModel>>(
                    future: controller.audioQuery.queryPlaylists(
                      ignoreCase: true,
                    ),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.data == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.data!.isEmpty) {
                        return Center(child: Center(child: Text('No Playlists Found', style: Ourstyle())));
                      } else {
                        return Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        child: Text("New"),
        onPressed: () {
          Get.to(() => SongSelection());
        },
      ),
    ),
    Expanded( // Wrap ListView.builder with Expanded
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final playlist = snapshot.data![index];
            return Container(
              margin: const EdgeInsets.only(top: 5),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                tileColor: Theme.of(context).colorScheme.tertiary,
                title: Namess(mxln: 2, text: playlist.playlist),
                subtitle: Namess(mxln: 1, text: playlist.numOfSongs.toString()),
                leading: QueryArtworkWidget(
                  id: snapshot.data![index].id, 
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget: musicIcon(),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () async {
                  final songs = await controller.audioQuery.queryAudiosFrom(
                    AudiosFromType.PLAYLIST,
                    playlist.id,
                  );
                  Get.to(() => PlaylistSongs(songs: songs, pageName:playlist.playlist,playlistId: playlist.id,));
                },
              ),
            );
          },
        ),
      ),
    ),
  ],
);

                      }
                    },
                  ),
                  FutureBuilder<List<AlbumModel>>(
                    future: controller.audioQuery.queryAlbums(
                      ignoreCase: true,
                    ),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.data == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.data!.isEmpty) {
                        return Center(child: Text('No Albums Found', style: Ourstyle()));
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final album = snapshot.data![index];
                              return Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  tileColor: Theme.of(context).colorScheme.tertiary,
                                  title: Namess(mxln:2,text:album.album),
                                  subtitle:Namess(mxln:1,text:album.numOfSongs.toString()) ,
                                  leading: QueryArtworkWidget(
                                    id: snapshot.data![index].id, 
                                    type: ArtworkType.AUDIO,
                                    nullArtworkWidget: musicIcon(),
                                    ),
                                  trailing: const Icon(Icons.chevron_right),
                                  onTap: () async {
                                    final songs = await controller.audioQuery.queryAudiosFrom(
                                      AudiosFromType.ALBUM_ID,
                                      album.id,
                                    );
                                    Get.to(() => PlaylistSongs(songs: songs,pageName:album.album));
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                  FutureBuilder<List<ArtistModel>>(
                    future: controller.audioQuery.queryArtists(
                      ignoreCase: true,
                    ),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.data == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.data!.isEmpty) {
                        return Center(child: Text('No Artists Found', style: Ourstyle()));
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final artist = snapshot.data![index];
                              return Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  tileColor: Theme.of(context).colorScheme.tertiary,
                                  title:Namess(mxln:2,text:artist.artist) ,
                                  subtitle:Namess(mxln:1,text:artist.numberOfTracks.toString()) ,
                                  leading: QueryArtworkWidget(
                                    id: snapshot.data![index].id, 
                                    type: ArtworkType.AUDIO,
                                    nullArtworkWidget: musicIcon(),
                                    ),
                                  trailing: const Icon(Icons.chevron_right),
                                  onTap: () async {
                                    final songs = await controller.audioQuery.queryAudiosFrom(
                                      AudiosFromType.ARTIST_ID,
                                      artist.id,
                                    );
                                    Get.to(() => PlaylistSongs(songs: songs,pageName:artist.artist));
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
