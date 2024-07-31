import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NaverMapApp(),
    );
  }
}

class NaverMapApp extends StatefulWidget {
  @override
  _NaverMapAppState createState() => _NaverMapAppState();
}

class _NaverMapAppState extends State<NaverMapApp> {
  final Completer<NaverMapController> _controller = Completer();
  NaverMapController? _mapController;
  final List<NMarker> _markers = [];

  void _onMapTap(Point point, NLatLng latlng) async {
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
        onMapTapped: _onMapTap,
      ),
    );
  }
}
