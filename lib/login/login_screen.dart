import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:map_memo_remember_moment/screen/home.dart';
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

  Future<UserCredential?> signIn(String email, String password)async{
    try{
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return credential;
    }on FirebaseAuthException catch(e){
      if (e.code == "user-not-found") {
        final snackBar = SnackBar(
          content: Text("유저를 찾을 수 없습니다", style: TextStyle(color: Colors.black),),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.white,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == "wrong-password") {
        final snackBar = SnackBar(
          content: Text("비밀번호가 틀립니다", style: TextStyle(color: Colors.black),),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.white,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }catch(e){
      print("$e");
    }
    return null;
  }

  Future<UserCredential?> signWithGoogle() async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


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
              key: _formKey,
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
                      onPressed: ()async{
                        if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          final result = await signIn(emailController.text.trim(), pwController.text.trim());

                          if (result != null) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("로그인 성공")));
                              context.go("/");
                            }
                          } else{
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("로그인 실패")));
                            }
                          }
                        }
                      },
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
                  context.go("/join");
                },
                child: Text("회원가입 하러가기", style: TextStyle(color: Colors.black),)
            ),
            GestureDetector(
              onTap: ()async{
                final userCredit = await signWithGoogle();
                if (userCredit == null) {
                  return;
                }  else{
                  context.go("/");
                }
              },
              child: Image.asset("assets/google_login.png"),
            )
          ],
        ),
      ),
    );
  }
}
