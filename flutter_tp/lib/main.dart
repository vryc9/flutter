import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/pages/bloc/charactersDetail_bloc.dart';
import 'package:flutter_tp/pages/bloc/charactersSearchList_bloc.dart';
import 'package:flutter_tp/pages/bloc/comicsSearchList_bloc.dart';
import 'package:flutter_tp/pages/bloc/seriesList_bloc.dart';
import 'package:flutter_tp/pages/character_detail_screen.dart';
import 'package:flutter_tp/pages/home_screen.dart';
import 'package:flutter_tp/pages/search_screen.dart';
import 'package:flutter_tp/pages/serie/series_list.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/bloc/moviesList_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CharacterSearchListBloc(""),
        ),
        BlocProvider(
          create: (_) => ComicsSearchListBloc(""),
        ),
        BlocProvider(
          create: (_) => SeriesListBloc(),
        ),
        BlocProvider(
          create: (_) => CharacterDetailBloc(""),
        ),
        BlocProvider(
          create: (_) => SeriesListBloc(),
        ),
        BlocProvider(
          create: (_) => MovieslistBloc(),
        )
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
      title: 'Flutter ESIEA',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(),
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: AppColors.screenBackground,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/search': (context) => const SearchScreen(),
        '/characterDetail': (context) => const CharacterDetailScreen(),
        '/home': (context) => const HomeScreen(),
        '/serieList': (context) => const SeriesListScreen(),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
              child: const Text('Aller à la page de recherche'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Aller à la page home'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/serieList');
              },
              child: const Text('Aller à la page série liste'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/characterDetail',
                  arguments: {
                    'characterId': "2350",
                  },
                );
              },
              child: const Text('Voir les détails de Billy'),
            ),
          ],
        ),
      ),
    );
  }
}
