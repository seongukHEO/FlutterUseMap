import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              onPressed: (){},
              icon: Icon(Icons.map_outlined)
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                child: Expanded(
                  child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (c, i){
                        return GestureDetector(
                          onTap: (){

                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("안녕하세여", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                              Text("2024.05.05"),
                              SizedBox(height: 20,)
                            ],
                          ),
                        );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
