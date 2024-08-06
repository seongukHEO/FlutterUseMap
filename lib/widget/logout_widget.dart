import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoutWidget extends StatefulWidget {
  const LogoutWidget({super.key});

  @override
  State<LogoutWidget> createState() => _LogoutWidgetState();
}

class _LogoutWidgetState extends State<LogoutWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Align(
        alignment: Alignment.center,
          child: Text("로그아웃")),
      content: Container(
        height: 80,
        child: Column(
          children: [
            Text("정말 로그아웃 하시겠습니까?"),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: (){
              
                      },
                      child: Text("네")
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("아니요")
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}