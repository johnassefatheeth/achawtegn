import 'package:flutter/material.dart';
import 'package:musica/const/colors.dart';
import 'package:musica/const/listTextStyle.dart';

AppBar customAppBar({String pagetitle="",Color abbgcolor=bgdarkcolor,Color themecolor=whitecolor,bool hasAction=false } ){
 return AppBar(
    title: Text(pagetitle,
          style: Ourstyle()) ,
    backgroundColor:Colors.transparent,
    iconTheme:IconThemeData(color: themecolor),
    actions: [!hasAction?const Icon(Icons.close, color:Colors.transparent):IconButton(onPressed:(){}, icon:Icon(Icons.search ,color: themecolor)
          )
        ]
 );
      }