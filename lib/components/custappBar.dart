import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/const/colors.dart';
import 'package:musica/pages/subPages/searchedSong.dart';

AppBar customAppBar({
  required BuildContext context,
  String pagetitle = "",
  Color abbgcolor = bgdarkcolor,
  Color themecolor = whitecolor,
  bool hasAction = false,
}) {
  return AppBar(
    title: Text(
      pagetitle,
      style: TextStyle(), // Adjust text color
    ),
    backgroundColor: Theme.of(context).colorScheme.tertiary,
    iconTheme: IconThemeData(),
    actions: [
      !hasAction
          ? const Icon(Icons.close, color: Colors.transparent)
          : PopupMenuButton<String>( // Specify the type parameter as String
              icon: Icon(Icons.search,),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<String>( // Specify the type parameter as String
                  child: SizedBox(
                    width: 600, // Set the width of the search field
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for a song...',
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onSubmitted: (String value) { 
                        
                        Get.to(() =>SearchedSongPage(songName:value));
                      },
                    ),
                  ),
                ),
              ],
            ),
    ],
  );
}
