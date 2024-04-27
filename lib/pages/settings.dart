import 'package:flutter/material.dart';
import 'package:musica/components/custappBar.dart';
import 'package:musica/const/listTextStyle.dart';
import 'package:musica/theme/themeProvider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

 bool darkmode=false;
 String Language='English';

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(pagetitle: "Settings",context: context),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            title: Text("Dark Mode",style: Ourstyle(),),
            trailing: Switch(
              value: darkmode, // Set initial value here
              onChanged: (bool value) {
                setState(() {
                  darkmode = value;
                  Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
                });
                
              },
            ),
          ),
          ListTile(
            title: Text("Language",style: Ourstyle()),
            trailing: DropdownButton<String>(
              value: Language, // Set initial value here
              onChanged: (String? newValue) {
                setState(() {
                  Language = newValue!; 
                });
              },
              items: <String>['English', 'አማርኛ']
                  .map
              ((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: TextStyle(
                    color: Colors.blue
                  ),),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
