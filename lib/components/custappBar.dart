import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/const/colors.dart';
import 'package:musica/pages/subPages/searchedSong.dart';

AppBar customAppBar({
  String pagetitle = "",
  Color abbgcolor = bgdarkcolor,
  Color themecolor = whitecolor,
  bool hasAction = false,
}) {
  return AppBar(
    title: Text(
      pagetitle,
      style: TextStyle(color: themecolor), // Adjust text color
    ),
    backgroundColor: abbgcolor,
    iconTheme: IconThemeData(color: themecolor),
    actions: [
      !hasAction
          ? const Icon(Icons.close, color: Colors.transparent)
          : PopupMenuButton<String>( // Specify the type parameter as String
              icon: Icon(Icons.search, color: themecolor),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<String>( // Specify the type parameter as String
                  child: SizedBox(
                    width: 600, // Set the width of the search field
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for a song...',
                        filled: true,
                        fillColor: bgcolor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onSubmitted: (String value) { // Specify the type parameter as String
                        // Handle search query submitted
                        // You can use the 'value' parameter here
                        
                        Get.to(() =>SearchedSongPage(songName:value));
                        // var searchedsongs = ;
                      },
                    ),
                  ),
                ),
              ],
            ),
    ],
  );
}
