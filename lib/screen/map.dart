import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:map_memo_remember_moment/model/memo.dart';
import 'package:map_memo_remember_moment/widget/calendar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class NaverMapApp extends StatefulWidget {
  @override
  _NaverMapAppState createState() => _NaverMapAppState();
}

class _NaverMapAppState extends State<NaverMapApp> {
  final Completer<NaverMapController> _controller = Completer();
  NaverMapController? _mapController;
  final List<NMarker> _markers = [];

  Future addMemo(String userUid, String title, String content, String date, int timeStamp, double lat, double lng)async{
    final memo = Memo(
      userUid: userUid,
      title: title,
      content: content,
      date: date,
      timeStamp: timeStamp,
      lat: lat,
      lng: lng
    );
    await FirebaseFirestore.instance.collection('memo').add(memo.toJson());
  }

  void _onMapTap(Point point, NLatLng latlng) async {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context){
          return CalendarWidget(
            onSave: (DateTime selectDate, String title, String content) async {
              final newMarker = NMarker(
                id: "test_${DateTime.now().millisecondsSinceEpoch}",
                position: latlng,
                caption: NOverlayCaption(
                  text: "${title}",
                ),
              );
              final timeStamp = DateTime.now().millisecondsSinceEpoch;
              final prefs = await SharedPreferences.getInstance();
              final userUid = prefs.getString('uid');

              setState(() {
                _markers.add(newMarker);
                addMemo(userUid??"", title, content, selectDate.toString(), timeStamp, latlng.latitude, latlng.longitude);
              });

              final controller = await _controller.future;
              controller.addOverlay(newMarker);
              print("날짜 : ${selectDate}");
            },
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("기억지도"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: NaverMap(
        onMapReady: (controller) {
          _controller.complete(controller);
          setState(() {
            _mapController = controller;
          });
        },
        options: NaverMapViewOptions(
          initialCameraPosition: NCameraPosition(
            target: NLatLng(37.5665, 126.9780), // Seoul coordinates
            zoom: 15,
          ),
          indoorEnable: true,
          locationButtonEnable: false,
          consumeSymbolTapEvents: false,
        ),
        onMapTapped: _onMapTap
      ),
    );
  }
}
