import 'package:flutter/material.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/const/colors.dart';

class profile extends StatelessWidget {


  final String displayName="john";
  final String email="jogndoe@gmail.com";
  final bool isLoggedIn=false;

  const profile({super.key});

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
              CircleAvatar(
                radius: 60,
                // Replace with actual profile picture
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQubUz3YKP7UQO_YFz5IQ1J4ou7sbDXAoy-40_eHoRTdA&s'),
              ),
              SizedBox(height: 16),
              Text(
                displayName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                email,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 32),
              if (isLoggedIn)
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement edit profile functionality
                  },
                  child: Text('Edit Profile'),
                )
              else
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement sign in functionality
                  },
                  child: Text('Sign In'),
                ),
              SizedBox(height: 16),
              if (isLoggedIn)
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement log out functionality
                  },
                  child: Text('Log Out'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement log out functionality
                  },
                  child: Text('Cloud'),
                ),
            ],
          ),
        ),
      ),
      
    );
  }
}