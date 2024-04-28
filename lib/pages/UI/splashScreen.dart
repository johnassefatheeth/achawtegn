import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:musica/pages/home.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset(
              "assets/Lottie/Animation - 1714053053966.json"),
          )
        ],
      ),
      nextScreen:Home() ,
      splashIconSize: 400 ,
      backgroundColor: Color.fromARGB(253, 255, 255, 255));
  }
}