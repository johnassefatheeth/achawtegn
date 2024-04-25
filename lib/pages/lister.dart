import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/const/colors.dart';
import 'package:musica/const/listTextStyle.dart';
import 'package:musica/constrolers/playerControl.dart';
import 'package:musica/pages/musicList.dart';
import 'package:on_audio_query/on_audio_query.dart';


  Padding Lister(snapshot,String listType){
    
    var controller = Get.put(playerController());
    return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final list = snapshot.data![index];
                              return Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  tileColor: bgcolor,
                                  title: Text(
                                    
                                    list.listType,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Ourstyle(),
                                  ),
                                  subtitle: Text(
                                    list.numOfSongs.toString() , 
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: Ourstyle(),
                                  ),
                                  leading: QueryArtworkWidget(
                                    id: snapshot.data![index].id, 
                                    type: ArtworkType.AUDIO,
                                    nullArtworkWidget: const Icon(
                                      Icons.music_note,
                                      color: whitecolor,
                                      size:32
                                    ),
                                    ),
                                  trailing: const Icon(Icons.chevron_right, color: whitecolor),
                                  onTap: () async {
                                    switch(listType) {
                                      case "playlist":
                                        final songs = await controller.audioQuery.queryAudiosFrom(
                                          AudiosFromType.PLAYLIST,
                                          list.id,
                                        );
                                        Get.to(() => PlaylistSongs(songs: songs,pageName:list.playlist));
                                        break;
                                      case "album":
                                        final songs = await controller.audioQuery.queryAudiosFrom(
                                            AudiosFromType.ALBUM_ID,
                                            list.id,
                                          );
                                          Get.to(() => PlaylistSongs(songs: songs,pageName:list.album));
                                        break;
                                      case "artist":
                                        final songs = await controller.audioQuery.queryAudiosFrom(
                                            AudiosFromType.ARTIST_ID,
                                            list.id,
                                          );
                                          Get.to(() => PlaylistSongs(songs: songs,pageName:list.artist));
                                        break;
                                    }
                                    
                                  },
                                ),
                              );
                            },
                          ),
                        );
  }
