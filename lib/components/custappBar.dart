import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/const/colors.dart';
import 'package:musica/pages/subPages/searchedSong.dart';

/// Custom AppBar widget with optional search functionality.
///
/// This widget creates an AppBar with customizable properties:
/// - [context]: The build context.
/// - [pagetitle]: The title displayed in the AppBar.
/// - [abbgcolor]: The background color of the AppBar.
/// - [themecolor]: The color scheme for icons and text.
/// - [hasAction]: Whether to include additional actions (e.g., search).
///
/// If [hasAction] is true, a search icon is displayed in the AppBar. When
/// tapped, a search field appears as a popup menu item. The user can enter
/// a search query, and the `onSubmitted` callback is triggered.
///
/// Example usage:
/// ```dart
/// customAppBar(
///   context: context,
///   pagetitle: 'My Page',
///   hasAction: true,
/// )
/// ```
///
/// Parameters:
/// - [context]: The build context.
/// - [pagetitle]: The title displayed in the AppBar.
/// - [abbgcolor]: The background color of the AppBar.
/// - [themecolor]: The color scheme for icons and text.
/// - [hasAction]: Whether to include additional actions (e.g., search).
///
/// Returns:
/// An AppBar widget with the specified properties.
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
      style: TextStyle(color: themecolor), // Adjust text color
    ),
    backgroundColor: abbgcolor,
    iconTheme: IconThemeData(color: themecolor),
    actions: [
      !hasAction
          ? const Icon(Icons.close, color: Colors.transparent)
          : PopupMenuButton<String>(
              icon: Icon(Icons.search),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<String>(
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
                        // Handle the submitted search query
                        Get.to(() => SearchedSongPage(songName: value));
                      },
                    ),
                  ),
                ),
              ],
            ),
    ],
  );
}
