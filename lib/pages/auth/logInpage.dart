import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/components/button.dart';
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


  void EMessage(String e){
    showDialog(
      context: context,
       builder: (context){
        return AlertDialog(title:Text(e));
       });
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
          EMessage(e.toString());
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
              const Text("forgot password?"),
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