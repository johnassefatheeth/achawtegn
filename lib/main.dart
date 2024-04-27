import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:musica/pages/UI/splashScreen.dart';
import 'package:musica/pages/auth/logInpage.dart';
import 'package:musica/pages/auth/signinPage.dart';
import 'package:musica/pages/home.dart';
import 'package:musica/pages/profile.dart';
import 'package:musica/pages/settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:musica/theme/themeProvider.dart';
import 'package:provider/provider.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  
   await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(create: (context)=>ThemeProvider(),
  child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'musica',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home:const Splash(),
      routes: {
        '/home':(context) => const Home(),
        '/myprofile':(context) =>  profile(),
        '/settings':(context) => const SettingsPage(),
        // '/rate':(context) => const Rate(),
        // '/FaQ':(context) => const FaQ(),
        '/signin':(context) => SignInPage(),
        '/login':(context)=>logInPage()

      },
    );
  }
}

