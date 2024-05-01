    import 'dart:io';

import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

GestureDetector options( {required SongModel song, required BuildContext context}){                                         
  return GestureDetector(
    onTap: () {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text('Rename'),
                  onTap: () {
                    Navigator.pop(context);
                    },
                    ),
                    ListTile(
                      title:const Text('Delete',
                      style: TextStyle(
                        color: Colors.red,
                        ),
                        ),
                        onTap: () async {
                          await showDialog(
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
                                       );})
                                       ;
                                       final file = File( Uri.parse(song.uri!).toString());
                                       if (await file.exists()) {
                                        file.delete();
                                        } else {
                                          print('Error: File not found');
                                          }
                                          Navigator.pop(context);
                                          },
                                          ),
                                          ListTile(
                                            title: Text('Set as ringtone'),
                                            onTap: () {// Handle set as ringtone option
                                            print('Set as ringtone option tapped');
                                            },
                                            ),
                                            ListTile(
                                               title: Text('Properties'),
                                               onTap: () async {
                                                await showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text('Song Info'),
                                                      content: Column(
                                                        children: [
                                                          Text('title-'+song.displayName),
                                                          Text('type-'+song.fileExtension),
                                                          Text('path-'+song.uri.toString()),
                                                          Text('date added-'+song.dateAdded.toString()),
                                                          Text('last modified-'+song.dateModified.toString()),
                                                        ],
                                                      ),
                                                    );
                                                  }
                                                );
                                                },
                                              ),
            ],
            ),
          );
        },
      );
    },
    child: const Icon(
      Icons.more_vert,
      size: 26,
      ),
      );

                                                  } 