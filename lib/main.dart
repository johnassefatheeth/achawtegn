import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:musica/constrolers/translate.dart';
import 'package:musica/pages/UI/splashScreen.dart';
import 'package:musica/pages/auth/logInpage.dart';
import 'package:musica/pages/auth/signinPage.dart';
import 'package:musica/pages/home.dart';
import 'package:musica/pages/profile.dart';
import 'package:musica/pages/settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:musica/theme/themeProvider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: MyApp(),
  ));
}

//root wigdet
class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  // build method
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Translate(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      title: 'musica',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const Splash(),
      routes: {
        '/home': (context) => const Home(),
        '/myprofile': (context) => profile(),
        '/settings': (context) => const SettingsPage(),
        // '/rate':(context) => const Rate(),
        // '/FaQ':(context) => const FaQ(),
        //navegate to sign in page
        '/signin': (context) => SignInPage(),
        //navagate to Login page
        '/login': (context) => logInPage()
      },
    );
  }
}
