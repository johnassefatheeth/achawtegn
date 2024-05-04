import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/components/button.dart';
import 'package:musica/components/charEdit.dart';
import 'package:musica/components/snackBar.dart';
import 'package:musica/components/textInput.dart';
import 'package:musica/pages/auth/logInpage.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();




  void signup() async {

    showDialog(context:context , 
    builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    );
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, 
          password: passwordController.text);
        Navigator.pop(context);
        Get.to(logInPage());

      } catch(e){
        
          Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
                                snakB(texContent: delchrs(e.toString()), duration: 3)
                              );
        
      }
        

        
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.tertiary,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              const Icon(
                Icons.person,
                size: 100,
              ),
              const SizedBox(height: 20),
              const Text("wana sign up?"),
              textfield(
                controller: emailController,
                obsecureText: false,
                hintText: "email",
              ),
              textfield(
                controller: passwordController,
                obsecureText: true,
                hintText: "password",
              ),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Get.to(logInPage());
                },
                child: const Text("don't have an account?log in")
                
                ),
              const SizedBox(height: 15),
              InputButton(
                onTap: signup,
                btnName:"sign in"
              ),
              SizedBox(height: 10),
              
            ],
          ),
        ),
      ),
    );
  }
}