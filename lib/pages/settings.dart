import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/const/listTextStyle.dart';
import 'package:musica/constrolers/myconstroller.dart';
import 'package:musica/theme/themeProvider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkmode = false;
  String Language = 'English';
  MygetxController myController = Get.put(MygetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(pagetitle: "settings".tr, context: context),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            title: Text("Dark Mode".tr, style: Ourstyle(),),
            trailing: Switch(
              value: darkmode,
              onChanged: (bool value) {
                setState(() {
                  darkmode = value;
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                });
              },
            ),
          ),
          ListTile(
            title: Text("language".tr, style: Ourstyle()),
            trailing: DropdownButton<String>(
              value: Language,
              onChanged: (String? newValue) {
                if (Language != 'English')
                  myController.changelanguage('en', 'US');
                else 
                  myController.changelanguage('am', 'ET');

                setState(() {
                  Language = newValue!;
                });
              },
              items: <String>['English', 'አማርኛ']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
