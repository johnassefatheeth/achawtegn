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
  var isPLaying=false.obs;
  var musicname=''.obs;
  var shuffle=false.obs;
  var loop=false.obs;


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

/// Updates the audio player position and duration streams.
///
/// This method listens to the duration and position streams provided by the audio player.
/// It updates the [duration] and [max] values based on the duration stream,
/// and the [position] and [val] values based on the position stream.
///
/// Additionally, it checks if the audio player has reached the end of the track
/// (i.e., position equals duration) and performs any necessary actions.
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
void toggleShuffle(){
  
    audioPlayer.setShuffleModeEnabled(!audioPlayer.shuffleModeEnabled);
    shuffle.value=audioPlayer.shuffleModeEnabled;
  }

playSong(SongModel song,int index){
  playIndex.value=index;
  musicname.value=song.displayName;

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