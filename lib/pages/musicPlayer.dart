import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/components/snackBar.dart';
import 'package:musica/const/colors.dart';
import 'package:musica/const/listTextStyle.dart';
import 'package:musica/constrolers/playerControl.dart';
import 'package:on_audio_query/on_audio_query.dart';

class mPlayer extends StatelessWidget {
  final List<SongModel> data;

  const mPlayer({Key? key, required this.data});

  String removeFirstZero(String inputString) {
    if (inputString.startsWith("0")) {
      return inputString.substring(2);
    } else {
      return inputString;
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(playerController());

    void playNextSong() {
      int nextIndex = controller.playIndex.value + 1;
      controller.playSong(data[nextIndex], nextIndex);
    }

    void playprevSong() {
      int nextIndex = controller.playIndex.value - 1;
      controller.playSong(data[nextIndex], nextIndex);
    }

    Timer? songEndTimer;

    void checkSongEnd() {
      songEndTimer?.cancel();
      songEndTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (controller.position.value == controller.duration.value) {
          if (controller.loop.value) {
            controller.playSong(data[controller.playIndex.value], controller.playIndex.value);
          } else {
            playNextSong();
          }
          timer.cancel();
        }
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkSongEnd();
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: customAppBar(pagetitle: "playing".tr, context: context),
      body: Column(
        children: [
          Obx(() => Expanded(
                child: Container(
                  height: 250,
                  width: 250,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: QueryArtworkWidget(
                    id: data[controller.playIndex.value].id,
                    type: ArtworkType.AUDIO,
                    artworkHeight: double.infinity,
                    artworkWidth: double.infinity,
                    nullArtworkWidget: const Icon(
                      Icons.music_note_sharp,
                      size: 250,
                    ),
                  ),
                ),
              ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                color: Theme.of(context).colorScheme.tertiary,
              ),
              child: Obx(() => Column(
                  children: [
                    Text(
                      data[controller.playIndex.value].displayNameWOExt,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Ourstyle(),
                    ),
                    Text(
                      data[controller.playIndex.value].artist.toString(),
                      style: Ourstyle(Islight: true),
                    ),
                    const SizedBox(height: 10),
                    Obx(() => Row(
                        children: [
                          Text(
                            removeFirstZero(controller.position.value),
                            style: Ourstyle(),
                          ),
                          Expanded(
                            child: Slider(
                              thumbColor: Color.fromARGB(255, 2, 64, 136),
                              activeColor: Color.fromARGB(255, 2, 64, 136),
                              inactiveColor: whitecolor,
                              min: const Duration(seconds: 0).inSeconds.toDouble(),
                              max: controller.max.value,
                              value: controller.val.value,
                              onChanged: (newValue) {
                                controller.changedurationtosec(newValue.toInt());
                                newValue = newValue;
                              },
                            ),
                          ),
                          Text(
                            removeFirstZero(controller.duration.value),
                            style: Ourstyle(),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 0,),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(() => Transform.scale(
                              scale: 1.5,
                              child: IconButton(
                                onPressed: () {
                                  if (controller.audioPlayer.shuffleModeEnabled) {
                                    controller.toggleShuffle();
                                    print(controller.shuffle.value);
                                  } else {
                                    controller.toggleShuffle();
                                    print(controller.shuffle.value);
                                  }
                                },
                                icon: controller.shuffle.value ? const Icon(
                                  Icons.shuffle,
                                  size: 18,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ) : const Icon(
                                  Icons.shuffle,
                                  size: 18,
                                  color: Color.fromARGB(221, 147, 147, 147),
                                ),
                              ),
                            )),
                            IconButton(
                              onPressed: () {
                                if (controller.playIndex.value - 1 > -1) {
                                  playprevSong();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    snakB(texContent: "no previos song", duration: 3)
                                  );
                                }
                              },
                              icon: const Icon(
                                Icons.skip_previous_rounded,
                                size: 40,
                              ),
                            ),
                            Obx(() => Transform.scale(
                              scale: 1.5,
                              child: IconButton(
                                onPressed: () {
                                  if (controller.isPLaying.value) {
                                    controller.audioPlayer.pause();
                                    controller.isPLaying(false);
                                  } else {
                                    controller.audioPlayer.play();
                                    controller.isPLaying(true);
                                  }
                                },
                                icon: controller.isPLaying.value ? const Icon(
                                  Icons.pause,
                                  size: 54,
                                ) : const Icon(
                                  Icons.play_arrow_rounded,
                                  size: 54,
                                ),
                              ),
                            )),
                            IconButton(
                              onPressed: () {
                                try {
                                  int nextIndex = controller.playIndex.value + 1;
                                  controller.playSong(data[nextIndex], nextIndex);
                                } catch(e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    snakB(texContent: "no next song", duration: 3)
                                  );
                                }
                              },
                              icon: const Icon(Icons.skip_next_rounded, size: 40),
                            ),
                            Obx(() => Transform.scale(
                              scale: 1.5,
                              child: IconButton(
                                onPressed: () {
                                  controller.loop.value = !controller.loop.value;
                                },
                                icon: controller.loop.value ? const Icon(
                                  Icons.loop,
                                  size: 18,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ) : const Icon(
                                  Icons.loop,
                                  size: 18,
                                  color: Color.fromARGB(221, 147, 147, 147),
                                ),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
