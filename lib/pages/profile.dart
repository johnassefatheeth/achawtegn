import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/const/colors.dart';

class profile extends StatelessWidget {

  final String displayName="john";
  final String email=FirebaseAuth.instance.currentUser!.email.toString();
  final bool isLoggedIn=true;

   profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(pagetitle: "My Profile"),
      backgroundColor: bgcolor,
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
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                email,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              if (isLoggedIn)
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text('Edit Profile'),
                )
              else
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text('Sign In'),
                ),
              const SizedBox(height: 16),
              if (isLoggedIn)
                ElevatedButton(
                  onPressed: () {
                  },
                  child: GestureDetector
                  (
                    onTap: (){
                      FirebaseAuth.instance.signOut();
                    },
                    child: const Text('Log Out')),
                ),
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text('Cloud'),
                ),
            ],
          ),
        ),
      ),
      
    );
  }
}