import 'package:flutter/material.dart';
import 'package:musica/components/button.dart';
import 'package:musica/components/textInput.dart';
import 'package:musica/const/colors.dart';

class logInPage extends StatelessWidget {
  logInPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.air,
                size: 100,
              ),
              const SizedBox(height: 20),
              const Text("wana sign up?"),
              textfield(
                controller: usernameController,
                obsecureText: false,
                hintText: "username",
              ),
              textfield(
                controller: passwordController,
                obsecureText: true,
                hintText: "your password",
              ),
              const Text("forgot password?"),
              const SizedBox(height: 15),
              Inputbutton(
                onTap: signIn,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Image.asset('lib/images/goog.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}