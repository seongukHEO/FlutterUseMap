import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:map_memo_remember_moment/screen/homeDetail.dart';
import 'package:map_memo_remember_moment/screen/map.dart';
import 'package:map_memo_remember_moment/screen/map_food.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/memo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<List<Memo>> getMemo()async{
    final pref = await SharedPreferences.getInstance();
    final userUid = pref.getString('uid');
    final db = FirebaseFirestore.instance;
    final resp = await db.collection("memo").where("userUid", isEqualTo: userUid).get();
    List<Memo> items = [];
    for(var doc in resp.docs){
      final item = Memo.fromJson(doc.data());
      final realItem = item.copyWith(userUid: userUid);
      items.add(realItem);
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("나의 기억 리스트"),
        actions: [
          IconButton(
              onPressed: (){
                context.go("/map");
              },
              icon: Icon(Icons.map_outlined)
          ),
          IconButton(
              onPressed: ()async{
                context.go("/map/food");
                SharedPreferences preferences = await SharedPreferences.getInstance();
                final userUid = preferences.getString("uid");
                print("uid : ${userUid}");
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
                child: FutureBuilder(
                  future: getMemo(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final items = snapshot.data ?? [];
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (c, i) {
                          final item = items[i];
                          return GestureDetector(
                            onTap: () {
                              context.go("/homeDetail", extra: item);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.title??"값이 없어요,,", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                                Text(item.date??"0000년"),
                                SizedBox(height: 20),
                                Divider(height: 1)
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return Center(child: CircularProgressIndicator(),);
                  }
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
