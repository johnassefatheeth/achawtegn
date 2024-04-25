import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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

  void signIn() async {

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
            children: [
              const Icon(
                Icons.air,
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
                onTap: signIn,
                btnName:"log in"
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  Image.asset('lib/images/goog.png',
                  height: 80,),
                  Image.asset('lib/images/appl.png',
                  height: 60,),
                  GestureDetector(
                    onTap: (){
                      Get.to(() => Home());
                    },
                    child: Text(
                      "log in as guest"
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