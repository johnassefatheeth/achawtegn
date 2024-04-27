import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class playerController extends GetxController{
    final audioQuery=OnAudioQuery();
    final audioPlayer=AudioPlayer();



  var playIndex=0.obs;
  var hasNext=true.obs;
  var hasPrev=false.obs;
  var isPLaying=false.obs;


  var duration=''.obs;
   var position=''.obs;
   var max= 0.0.obs;
   var val= 0.0.obs;

    @override
    void onInit(){
      super.onInit();

      checkPermission();
    }

changedurationtosec(seconds){
  var duration=Duration(seconds:seconds );
  audioPlayer.seek(duration);
}


updatePostion(){
  audioPlayer.durationStream.listen((d) {
    duration.value=d.toString().split(".")[0];
    max.value=d!.inSeconds.toDouble();
  });
  audioPlayer.positionStream.listen((p) { 
    position.value=p.toString().split(".")[0];
    val.value=p.inSeconds.toDouble();
  });

  if(audioPlayer.position==audioPlayer.duration){
                        }

}


playSong(SongModel song,index){
  playIndex.value=index;
  try{
  audioPlayer.setAudioSource(
    AudioSource.uri(
      Uri.parse(song.uri!),
      tag: MediaItem(
        id: song.id.toString(),
        album: song.album,
        title: song.displayNameWOExt,
        artUri: Uri.parse(song.uri!),
  ),
      
      )
  );
  audioPlayer.play();
  isPLaying.value=true;
  if(!audioPlayer.hasNext)
    hasNext.value=false;
  if(audioPlayer.hasPrevious)
    hasPrev.value=true;
  updatePostion();
  }
  on Exception catch (e){
    print(e.toString());
  }
}

    checkPermission()async{
      var perm = await Permission.storage.request();
      if(perm.isGranted);
      else{
        checkPermission();
      }
    }
}