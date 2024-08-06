import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:map_memo_remember_moment/model/memo.dart';

import '../model/memo.dart';

class HomeDetailScreen extends StatefulWidget {
  final Memo memo;

  const HomeDetailScreen({required this.memo ,super.key});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("메모 자세히 보기"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/lottie_home.json"),
                Text(widget.memo.title??"", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                Text(widget.memo.date??""),
                SizedBox(height: 30,),
                Text(widget.memo.content??"")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
