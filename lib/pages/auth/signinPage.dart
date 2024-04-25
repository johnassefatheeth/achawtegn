import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musica/components/button.dart';
import 'package:musica/components/textInput.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();


  void EMessage(String e){
    showDialog(
      context: context,
       builder: (context){
        return AlertDialog(title:Text(e) ,);
       });
  }





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

      }on FirebaseAuthException catch(e){
        
          Navigator.pop(context);
          EMessage(e.code);
        
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
                  Navigator.pushNamed(context, "/login");
                },
                child: const Text("don't have an account?log in")
                
                ),
              const SizedBox(height: 15),
              Inputbutton(
                onTap: signup,
                btnName:"sign in"
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