import 'package:flutter/material.dart';
import 'package:instaclone/services/auth_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void signIn(context){
    final authService = AuthService();
    try{
      authService.signInWithEmailAndPassword(_emailController.text, _passwordController.text);
    }
    catch(e){
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text(e.toString())
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 150,),
          const Center(
            child: Icon(Icons.blur_on, color: Colors.black,size: 200,)
          ),
          const SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(
              hintText: "E-mail",
              enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
              color: Colors.black,
              )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            )
          ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                // enabledBorder: OutlineInputBorder(),
                hintText: "Password",
                enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
              )
            ),
            ),
            ),
          ),
          const SizedBox(height: 50,),
          GestureDetector(
          onTap: () => signIn(context),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            )
          ),
          )
        ],
      )      
    );
  }
}