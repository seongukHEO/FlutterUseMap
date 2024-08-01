import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:go_router/go_router.dart';
import 'package:map_memo_remember_moment/login/join_screen.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:map_memo_remember_moment/login/login_screen.dart';
import 'package:map_memo_remember_moment/screen/home.dart';
import 'package:map_memo_remember_moment/screen/homeDetail.dart';
import 'package:map_memo_remember_moment/screen/map.dart';
import 'package:map_memo_remember_moment/screen/map_food.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  await _initialize();
  runApp( MyApp());
}


Future<void> _initialize() async {
  await NaverMapSdk.instance.initialize(
    clientId: '835v8c6lw9',
    onAuthFailed: (e) => print(e),
  );
}


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = GoRouter(
    initialLocation: "/login",
      routes: [
        GoRoute(
            path: "/",
          builder: (context, state) => HomeScreen(),
          routes: [
            GoRoute(
                path: "homeDetail",
                builder: (context, state) => HomeDetailScreen()
            ),
            GoRoute(
                path: "map/food",
                builder: (context, state) => MapFood()
            ),
            GoRoute(
                path: "map",
                builder: (context, state) => NaverMapApp()
            ),
          ]
        ),
        GoRoute(
            path: "/login",
          builder: (context, state) => LoginScreen()
        ),
        GoRoute(
            path: "/join",
            builder: (context, state) => SignupScreen()
        ),
      ]
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

