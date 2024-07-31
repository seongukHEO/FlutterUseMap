import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class NaverMapApp extends StatefulWidget {
  @override
  _NaverMapAppState createState() => _NaverMapAppState();
}

class _NaverMapAppState extends State<NaverMapApp> {
  final Completer<NaverMapController> _controller = Completer();
  NaverMapController? _mapController;
  final List<NMarker> _markers = [];
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleTEC = TextEditingController();

  TextEditingController contentTEC = TextEditingController();

  TextEditingController dateTEC = TextEditingController();

  void _onMapTap(Point point, NLatLng latlng) async {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Align(
              alignment: Alignment.center,
                child: Text("메모 입력", style: TextStyle(fontWeight: FontWeight.bold),)),
            content: Container(
              height: 700,
              width: 400,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleTEC,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "메모 제목 입력"
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: contentTEC,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "메모 내용 입력"
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
    final newMarker = NMarker(
      id: "test_${DateTime.now().millisecondsSinceEpoch}",
      position: latlng,
      caption: NOverlayCaption(
        text: "위도: ${latlng.latitude}, 경도: ${latlng.longitude}",
      ),
    );

    setState(() {
      _markers.add(newMarker);
    });

    final controller = await _controller.future;
    controller.addOverlay(newMarker);

    print("위도 : ${latlng.latitude}, 경도 : ${latlng.longitude}");
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
