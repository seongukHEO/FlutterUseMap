import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeDetailScreen extends StatefulWidget {
  const HomeDetailScreen({super.key});

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
                Text("안녕하세용~", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                Text("2024-07-27"),
                SizedBox(height: 30,),
                Text("나는 오늘도 알바에 갔다\n정말로 말이지 알바 가기가 너무나도 싫다 그래도 담주에 축구도 보러가고\n강남도 가고 하니까 초큼만 버텨보자구~")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
