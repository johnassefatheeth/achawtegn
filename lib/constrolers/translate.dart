import 'package:get/get.dart';

class Translate extends Translations{


  @override
  Map<String, Map<String,String>> get keys=>{
    'en_US':{
      'settings': 'settings',
      'language':'language',
      'Dark Mode': 'Dark Mode',
      'myprofile':'my profile',
      'rate': 'rate',
      'music':'music',
      'songs': 'songs',
      'playlist':'playlist',
      'album': 'album',
      'artists':'artists',
      'playing': 'playing',
      'search':'search',
    },
    'am_ET':{
      'settings': 'ማስተካከያ',
      'language':'ቋንቋዎች',
      'Dark Mode': 'ጨለማ ሞድ',
      'myprofile':'የኔ አካውንት',
      'rate': 'አርም',
      'music':'ዜማዎች',
      'songs': 'ነጠላ',
      'playlist':'ዝርዝሮች',
      'album': 'አልበም',
      'artists':'ዜመኞች',
      'playing': 'በማጫወት ላይ',
      'search':'ፈልግ',
    }
  };
}
