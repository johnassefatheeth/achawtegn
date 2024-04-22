import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:musica/components/Drawerlist.dart';
import 'package:musica/components/drawerHeader.dart';
import 'package:musica/const/colors.dart';
import 'package:musica/const/listTextStyle.dart';
import 'package:musica/constrolers/playerControl.dart';
import 'package:on_audio_query/on_audio_query.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(playerController());
    return Scaffold(
      backgroundColor: bgdarkcolor,
      appBar: AppBar(
        backgroundColor: bgdarkcolor,
        iconTheme:const IconThemeData(color: Colors.white),
         actions: [
          IconButton(onPressed:(){}, icon:const Icon(Icons.search ,color: whitecolor,))
        ],
        title:Text(
          "musica",
          style: Ourstyle(),
        ),
      ),
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
        if(snapshot.data==null){
          return const Center(
            child: CircularProgressIndicator(),
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
          itemCount: 100,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 5),
              child:ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                tileColor: bgcolor,
                title: Text("music name",
                style: Ourstyle(),
                ),
                subtitle:Text("artist",
                style: Ourstyle(),
                ),
                leading:const Icon(
                  Icons.music_note,
                  color: whitecolor,
                  size:32
                ),
                trailing:const Icon(
                  Icons.play_arrow,
                  color: whitecolor,
                  size:26
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