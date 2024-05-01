
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/components/button.dart';
import 'package:musica/components/snackBar.dart';
import 'package:musica/components/textInput.dart';
import 'package:musica/pages/auth/signinPage.dart';
import 'package:musica/pages/home.dart';
class logInPage extends StatefulWidget {
  logInPage({Key? key}) : super(key: key);

  @override
  State<logInPage> createState() => _logInPageState();
}

class _logInPageState extends State<logInPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();


  String delchrs(String inputString) {
  StringBuffer result = StringBuffer();
  bool insideBrackets = false;

  for (int i = 0; i < inputString.length; i++) {
    if (inputString[i] == '[') {
      insideBrackets = true;
      continue;
    } else if (inputString[i] == ']') {
      insideBrackets = false;
      continue;
    }

    if (!insideBrackets) {
      result.write(inputString[i]);
    }
  }

  return result.toString();
}

  void logIn() async {

    showDialog(context:context , 
    builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    );
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text);
        Navigator.pop(context);
        Get.to(() => Home());
      }catch(e){
        
          Navigator.pop(context);
          print(e.toString());
          ScaffoldMessenger.of(context).showSnackBar(
                                snakB(texContent: delchrs(e.toString()), duration: 3)
                                )
                              ;
      }
        

        
  }

  void resetPass() async {

    showDialog(context:context , 
    builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    );
      try{
        await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(delchrs("email sent")),
                                  duration: Duration(seconds: 5),

                                )
                              );
      }catch(e){
        
          Navigator.pop(context);
          print(e.toString());
          ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(delchrs(e.toString())),
                                  duration: Duration(seconds: 5),

                                )
                              );
      }
        

        
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 20,),
              const Icon(
                Icons.login,
                size: 100,
              ),
              const SizedBox(height: 20),
              const Text("wana log in?"),
              textfield(
                controller: emailController,
                obsecureText: false,
                hintText: "email",
              ),
              textfield(
                controller: passwordController,
                obsecureText: true,
                hintText: "your password",
              ),
              TextButton(onPressed: (){

              },
              child: Text("forgot password"),),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Get.to(() => SignInPage());
                },
                child: const Text("don't have an account?sign up")
                
                ),
              const SizedBox(height: 15),
              Inputbutton(
                onTap: logIn,
                btnName:"log in"
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(() => Home());
                    },
                    child: Text(
                      "continue in as guest"
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}