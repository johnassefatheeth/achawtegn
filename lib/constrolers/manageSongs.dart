import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ManageSongs  {
  
  get context => null;


  Future<void> deleteSong(String filePath) async {
    // Confirm deletion with the user (optional)
    if (await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Song'),
          content: Text('Are you sure you want to delete this song?'),
          actions: [
            TextButton(
              onPressed: () =>{Navigator.pop(context, false)} ,
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('Delete'),
            ),
          ],
        );
      },
    )) {
      // Delete the file using the file system (cautiously)
      
    }
  }

  @override
  Widget build(BuildContext context) {


    return const Placeholder();
  }
}