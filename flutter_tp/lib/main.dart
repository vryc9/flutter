import 'package:flutter/material.dart';
import 'package:flutter_tp/pages/character_detail_screen.dart';
import 'package:flutter_tp/pages/search.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const CharacterDetailScreen(characterId: "40553"),
      routes: [
        GoRoute(
          path: '/character',
          builder: (BuildContext context, GoRouterState state) =>
              const CharacterDetailScreen(characterId: "40553"),
        ),
      ],
    ),
  ]);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: _router,
    );
  }
}
