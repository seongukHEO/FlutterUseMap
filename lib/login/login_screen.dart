import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:map_memo_remember_moment/login/join_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 300,
                  height: 300,
                  child: Lottie.asset('assets/lottie_home.json')
              ),
            ),
            Form(
                child:Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "이메일"
                        ),
                        controller: emailController,
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "비밀번호",
                        ),
                        obscureText: true,
                        controller: pwController,
                      )
                    ],
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  MaterialButton(
                      onPressed: (){},
                      height: 48,
                      minWidth: double.infinity,
                      child: Text("로그인", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                      color: Colors.teal,
                  ),
                ],
              ),
            ),
            TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SignupScreen();
                  }));
                },
                child: Text("회원가입 하러가기", style: TextStyle(color: Colors.black),)
            ),
          ],
        ),
      ),
    );
  }
}
