import 'package:get/get.dart';

class Translate extends Translations{


  @override
  Map<String, Map<String,String>> get keys=>{
    'en_US':{
      'settings': 'settings',
      'languages':'languages',
      'Dark Mode': 'Dark Mode',
      'myprofile':'my profile',
      'rate': 'rate',
      'music':'music',
      'songs': 'songs',
      'playlist':'playlist',
      'album': 'album',
      'artist':'artist',
      'playing': 'playing',
      'search for a song':'search for a song',
    },
    'am_ET':{
      'settings': 'ማስተካከያ',
      'languages':'ቋንቋዎች',
      'dark mode': 'ጨለማ ሞድ',
      'my profile':'የኔ አካውንት',
      'rate': 'አርም',
      'music':'ዜማዎች',
      'songs': 'ነጠላ',
      'playlist':'ዝርዝሮች',
      'album': 'አልበም',
      'artist':'ዜመኞች',
      'playing': 'በማጫወት ላይ',
      'search for a song':'ዜማን ፈልግ',
    }
  };
}
