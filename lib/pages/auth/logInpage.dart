
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musica/components/button.dart';
import 'package:musica/components/charEdit.dart';
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
                                snakB(texContent:"email sent", duration:3));
                              
      }catch(e){
          Navigator.pop(context);
          print(e.toString());
          ScaffoldMessenger.of(context).showSnackBar(
                                snakB(texContent:delchrs(e.toString()), duration:4));
      }
  }

  

  @override
  Widget build(BuildContext context) {
    return authPage(Header:"wana log in?",Iconn:Icons.login, passcont:passwordController, emailcont:emailController ,hasforgot:true);
  }

  Scaffold authPage( {required String Header, required IconData Iconn, required TextEditingController passcont, required TextEditingController emailcont, required bool hasforgot}) {
    return Scaffold(
    body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SizedBox(height: 20,),
            Icon(
              Iconn,
              size: 100,
            ),
            const SizedBox(height: 20),
            Text(Header),
            textfield(
              controller: emailcont,
              obsecureText: false,
              hintText: "email",
            ),
            textfield(
              controller: passcont,
              obsecureText: true,
              hintText: "your password",
            ),
            hasforgot?
            TextButton(onPressed: (){
              resetPass();
            },
            child: Text("forgot password"),):
            SizedBox(height: 0),
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
      ),
    ),
  );
  }
}