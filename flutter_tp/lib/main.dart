import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/pages/bloc/charactersDetail_bloc.dart';
import 'package:flutter_tp/pages/bloc/charactersList_bloc.dart';
import 'package:flutter_tp/pages/bloc/charactersSearchList_bloc.dart';
import 'package:flutter_tp/pages/bloc/comicsDetail_bloc.dart';
import 'package:flutter_tp/pages/bloc/comicsList_bloc.dart';
import 'package:flutter_tp/pages/bloc/comicsSearchList_bloc.dart';
import 'package:flutter_tp/pages/bloc/moviesSearchList_bloc.dart';
import 'package:flutter_tp/pages/bloc/serieDetail_bloc.dart';
import 'package:flutter_tp/pages/bloc/seriesList_bloc.dart';
import 'package:flutter_tp/pages/bloc/seriesSearchList_bloc.dart';
import 'package:flutter_tp/pages/content_detail_page.dart';
import 'package:flutter_tp/pages/generic_list.dart';
import 'package:flutter_tp/pages/home_screen.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/widgets/navbar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/bloc/moviesList_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CharactersSearchListBloc(""),
        ),
        BlocProvider(
          create: (_) => SeriesSearchListBloc(""),
        ),
        BlocProvider(
          create: (_) => ComicsSearchListBloc(""),
        ),
        BlocProvider(
          create: (_) => MoviesSearchListBloc(""),
        ),
        BlocProvider(
          create: (_) => CharacterDetailBloc(""),
        ),
        BlocProvider(
          create: (_) => SeriesListBloc(),
        ),
        BlocProvider(
          create: (_) => MoviesListBloc(),
        ),
        BlocProvider(
          create: (_) => CharactersListBloc(),
        ),
        BlocProvider(
          create: (_) => ComicsListBloc(),
        ),
        BlocProvider(
          create: (_) => ComicDetailBloc(""),
        ),
        BlocProvider(
          create: (_) => SerieDetailBloc(""),
        ),
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
      title: 'Flutter ESIEA groupe 8',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(),
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: AppColors.screenBackground,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainNavigationBar(),
        '/comicList': (context) => const MainNavigationBar(
              initialIndex: 1,
              child: GenericListScreen(type: "comic"),
            ),
        '/serieList': (context) => const MainNavigationBar(
              initialIndex: 2,
              child: GenericListScreen(type: "serie"),
            ),
        '/movieList': (context) => const MainNavigationBar(
              initialIndex: 3,
              child: GenericListScreen(type: "movie"),
            ),
        '/characterDetail': (context) => const ContentDetailPage(type: "character"),
        '/comicDetail': (context) => const ContentDetailPage(type: "comic"),
        '/movieDetail': (context) => const ContentDetailPage(type: "movie"),
        '/serieDetail': (context) => const ContentDetailPage(type: "serie"),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
