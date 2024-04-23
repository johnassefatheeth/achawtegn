import 'package:flutter/material.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/const/colors.dart';

class settings extends StatelessWidget {
  const settings ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(pagetitle: "Settings"),
      backgroundColor: bgcolor,
    );
  }
}