import 'package:flutter/material.dart';
import 'package:musica/const/colors.dart';

class logInPage extends StatelessWidget {
  const logInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.air,
            size: 100,),
            SizedBox(height: 50),
            Text("wana sign up?"),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: whitecolor
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey
                    )
                  )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: bgdarkcolor
                    )
                  ),
                  fillColor: Color.fromARGB(179, 127, 121, 121),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey
                    )
                  )
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}