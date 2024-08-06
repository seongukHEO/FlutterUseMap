import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:map_memo_remember_moment/model/memo.dart';
import 'package:map_memo_remember_moment/screen/home.dart';
import 'package:map_memo_remember_moment/screen/homeDetail.dart';
import 'package:map_memo_remember_moment/screen/map.dart';
import 'package:map_memo_remember_moment/screen/map_food.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';
import 'login/join_screen.dart';
import 'login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await _initialize();
  final initialRoute = await _getUserUid() != null ? '/' : '/login';
  runApp(MyApp(initialRoute: initialRoute));
}

Future<void> _initialize() async {
  await NaverMapSdk.instance.initialize(
    clientId: '835v8c6lw9',
    onAuthFailed: (e) => print(e),
  );
}

Future<String?> _getUserUid() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString("uid");
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  MyApp({required this.initialRoute, super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: initialRoute,
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => HomeScreen(),
          routes: [
            GoRoute(
              path: "homeDetail",
              builder: (context, state) => HomeDetailScreen(memo: state.extra as Memo),
            ),
            GoRoute(
              path: "map/food",
              builder: (context, state) => MapFood(),
            ),
            GoRoute(
              path: "map",
              builder: (context, state) => NaverMapApp(),
            ),
          ],
        ),
        GoRoute(
          path: "/login",
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: "/join",
          builder: (context, state) => SignupScreen(),
        ),
      ],
    );

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
