import 'package:flutter/material.dart';
import 'package:musica/const/colors.dart';

AppBar customAppBar( String pagetitle,{Color abbgcolor=bgdarkcolor,Color themecolor=whitecolor,bool hasAction=false } ){
 return AppBar(
    title: Text(pagetitle) ,
    backgroundColor:abbgcolor,
    iconTheme:IconThemeData(color: themecolor),
    actions: [!hasAction?Icon(Icons.close, color: themecolor):IconButton(onPressed:(){}, icon:Icon(Icons.search ,color: themecolor)
          )
        ]
 );
      }