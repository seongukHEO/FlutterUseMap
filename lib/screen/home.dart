import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_memo_remember_moment/screen/homeDetail.dart';
import 'package:map_memo_remember_moment/screen/map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("나의 기억 리스트"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return NaverMapApp();
                }));
              },
              icon: Icon(Icons.map_outlined)
          ),
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return NaverMapApp();
                }));
              },
              icon: Icon(Icons.list)
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (c, i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return HomeDetailScreen();
                        }));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("안녕하세요", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                          Text("2024.05.05"),
                          SizedBox(height: 20),
                          Divider(height: 1)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
