import 'package:flutter/material.dart';
import 'package:flutter_tp/pages/search.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_tp/res/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const Searchpage(),
      routes: [
        GoRoute(
          path: '/product',
          builder: (BuildContext context, GoRouterState state) =>
              const Searchpage(),
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