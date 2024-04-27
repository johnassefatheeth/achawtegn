import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerList extends StatefulWidget {
  const DrawerList({super.key});

  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem("myprofile".tr, Icons.person),
          menuItem("settings".tr, Icons.settings),
          menuItem("rate".tr, Icons.rate_review),
          menuItem("FaQ", Icons.format_quote)
        ],
      ),
    );
  }

  Widget menuItem(String title, IconData icon) {
  return Material(
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/$title');

      },
      child: Padding(
        padding:const EdgeInsets.only(top:15.0,bottom: 15,left: 30),
        child: Row(
          children: [
            Icon(icon,),
            const SizedBox(width: 8), // Adding space between icon and text
            Expanded(
              child: Text(
                title,
                style:const TextStyle(fontSize: 16), // Adjust text size as needed
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

}