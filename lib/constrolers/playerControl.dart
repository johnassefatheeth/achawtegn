import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class playerController extends GetxController{
    final audioQuery=OnAudioQuery();


    @override
    void onInit(){
      super.onInit();

      checkPermission();
    }



    checkPermission()async{
      var perm = await Permission.storage.request();
      if(perm.isGranted);
      else{
        checkPermission();
      }
    }
}