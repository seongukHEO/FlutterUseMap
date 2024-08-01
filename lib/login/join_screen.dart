
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupScreen(),
    );
  }
}

class SignupScreen extends StatefulWidget {


  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with TickerProviderStateMixin {

  void showSnackbar(String message){
    var snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: Colors.black),),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  final _formKey = GlobalKey<FormState>();

  static const String _logoMessage = "RememberMoment";
  String get _currentString => _logoMessage;

  late Animation<int> _logoCount;
  late AnimationController _animationController;

  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  void setAnimation() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 2500));
    _logoCount = StepTween(begin: 0, end: _currentString.length).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn)
    );
    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          _animationController.reverse();
        });
      } else if (status == AnimationStatus.dismissed) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          _animationController.forward();
        });
      }
    });

    // Start the animation
    _animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    setAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원가입"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _logoCount,
              builder: (context, child) {
                String text = _currentString.substring(0, _logoCount.value);
                return Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.green,
                    ),
                  ),
                );
              },
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "이메일",
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return "이메일을 입력하세요";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: pwController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "비밀번호",
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return "비밀번호를 입력하세요";
                        }
                          return null;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: MaterialButton(
                        onPressed: (){
                          if (emailController.text.isEmpty || emailController.text == null) {
                            showSnackbar("이메일을 입력 해주세요");
                          }  else if (pwController.text.isEmpty || pwController.text == null) {
                            showSnackbar("비밀번호를 입력 해주세여");
                          } else{
                            context.go("/login");
                          }
                        },
                        height: 48,
                        minWidth: double.infinity,
                        child: Text("가입학기", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

