import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musica/pages/auth/logInpage.dart';
import 'package:musica/pages/home.dart';

class AuhtCheck extends StatelessWidget {
  const AuhtCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Home();
          }
          else{
            return logInPage();
          }
        }, )
    );
  }
}