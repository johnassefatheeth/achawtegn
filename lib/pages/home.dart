import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:musica/components/Drawerlist.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/components/drawerHeader.dart';
import 'package:musica/const/colors.dart';
import 'package:musica/const/listTextStyle.dart';
import 'package:musica/constrolers/playerControl.dart';
import 'package:musica/pages/musicPlayer.dart';
import 'package:on_audio_query/on_audio_query.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(playerController());
    return Scaffold(
      backgroundColor: bgdarkcolor,
      appBar: customAppBar( hasAction: true, pagetitle: "music"),
      drawer: Drawer(
        child: SingleChildScrollView(
          child:Container(
            child:const Column(
              children: [
                DrawerHeaderpart(),
                 DrawerList(),
                 
                
              ],
            ),
          ) ,),
        
      ),
      body:FutureBuilder<List<SongModel>>(
        future: controller.audioQuery.querySongs(
          ignoreCase: true,
          orderType: OrderType.ASC_OR_SMALLER,
          sortType: null,
          uriType: UriType.EXTERNAL
        ), 
      builder: (BuildContext context, snapshot) {
        if(snapshot.data == null){
          return const Center(
            child:  CircularProgressIndicator(),
          );
        }
        else if(snapshot.data!.isEmpty){
          return Text('no Songs found',style: Ourstyle());
        }
        else {
          return Padding( 
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics:const BouncingScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 5),
              child:Obx(()=>ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  tileColor: bgcolor,
                  title: Text(snapshot.data![index].displayNameWOExt,
                  textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                  style: Ourstyle(),
                  ),
                  subtitle:Text( "${snapshot.data![index].artist}",
                  textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                  style: Ourstyle(),
                  ),
                  leading:QueryArtworkWidget(
                    id: snapshot.data![index].id, 
                    type: ArtworkType.AUDIO,
                    nullArtworkWidget: const Icon(
                      Icons.music_note,
                      color: whitecolor,
                      size:32
                    ),
                    ),
                  trailing:controller.playIndex.value==index &&controller.isPLaying.value?
                  const Icon(
                    Icons.play_arrow,
                    color: whitecolor,
                    size:26
                  ):const Icon(
                    Icons.music_note_outlined,
                    color: whitecolor,
                    size:26
                  ),
                  onTap: () {
                    Get.to(()=> mPlayer(data: snapshot.data!,));
                    controller.playSong(snapshot.data![index].uri,index);
                  },
                ),
              )
              );
          },
        ),
      );
        }
      }
      )
      );
  }
}