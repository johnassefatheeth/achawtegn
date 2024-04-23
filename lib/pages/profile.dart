import 'package:flutter/material.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/const/colors.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(pagetitle: "My Profile"),
      backgroundColor: bgcolor,
      
    );
  }
}