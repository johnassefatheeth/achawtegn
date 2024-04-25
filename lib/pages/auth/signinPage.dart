import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musica/components/button.dart';
import 'package:musica/components/textInput.dart';
import 'package:musica/const/colors.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();


  void wrongEmailMessage(){
    showDialog(
      context: context,
       builder: (context){
        return AlertDialog(title:Text("incorrect email") ,);
       });
  }



void WrongpasswordMessage(){
    showDialog(
      context: context,
       builder: (context){
        return const AlertDialog(title:Text("incorrect password") ,);
       });
  }

  void signIn() async {

    // showDialog(context:context , 
    // builder: (context){
    //   return const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }
    // );
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text);
        Navigator.pop(context);
      }on FirebaseAuthException catch(e){
        if(e.code=="user-not-found"){
          Navigator.pop(context);
          wrongEmailMessage();
        }
        else if(e.code=="wrong-password"){
          Navigator.pop(context);
          WrongpasswordMessage();
        }
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
              const Text("wana sign up?"),
              textfield(
                controller: emailController,
                obsecureText: false,
                hintText: "username",
              ),
              textfield(
                controller: passwordController,
                obsecureText: true,
                hintText: "your password",
              ),
              const Text("forgot password?"),
              const SizedBox(height: 10,),
              const Text("don't have an account?sign up"),
              const SizedBox(height: 15),
              Inputbutton(
                onTap: signIn,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  Image.asset('lib/images/goog.png',
                  height: 80,),
                  Image.asset('lib/images/appl.png',
                  height: 60,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}