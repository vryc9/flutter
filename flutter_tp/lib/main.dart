import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/pages/bloc/charactersList_bloc.dart';
import 'package:flutter_tp/pages/bloc/comicsList_bloc.dart';
import 'package:flutter_tp/pages/search_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CharacterListBloc(""),
        ),
        BlocProvider(
          create: (_) => ComicsListBloc(""),
        ),
        // Ajoutez d'autres blocs si nécessaire
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/search': (context) => const SearchScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Naviguer vers SearchpageTest
            Navigator.pushNamed(context, '/search');
          },
          child: const Text('Aller à la recherche'),
        ),
      ),
    );
  }
}
