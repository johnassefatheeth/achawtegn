import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/pages/auth/logInpage.dart';
import 'package:musica/pages/auth/signinPage.dart';

class profile extends StatefulWidget {


   profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final String displayName="john";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(pagetitle: "My Profile",context: context),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQubUz3YKP7UQO_YFz5IQ1J4ou7sbDXAoy-40_eHoRTdA&s'),
              ),
              const SizedBox(height: 16),
              Text(
                displayName,
                style: const TextStyle(fontSize: 20, fontWeight:FontWeight.bold),
              ),
              const SizedBox(height: 8),
               Text(
                (FirebaseAuth.instance.currentUser==null)?"":FirebaseAuth.instance.currentUser!.email.toString(),
                style: const TextStyle(fontSize: 16, ),
              ),
              const SizedBox(height: 32),
              if (FirebaseAuth.instance.currentUser!=null)
                ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Edit Profile',style: TextStyle(
                    color: Theme.of(context).colorScheme.primary
                  ),),
                ),
              if (FirebaseAuth.instance.currentUser==null)
                ElevatedButton(
                  onPressed: () {
                    Get.to(SignInPage());
                  },
                  child: Text('Sign In'),
                ),
                if (FirebaseAuth.instance.currentUser==null)
                ElevatedButton(
                  onPressed: () {
                    Get.to(logInPage());
                  },
                  child: const Text('log In'),
                ),
              const SizedBox(height: 16),
              if (FirebaseAuth.instance.currentUser!=null)
                ElevatedButton(
                  onPressed: () {
                  },
                  child: GestureDetector
                  (
                    onTap: (){
                      FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, "/login");
                    },
                    child: Text('Log Out',style:TextStyle(
                  ))),
                ),
                if (FirebaseAuth.instance.currentUser!=null)
                ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Cloud',style:TextStyle(
                  )),
                ),
            ],
          ),
        ),
      ),
      
    );
  }
}