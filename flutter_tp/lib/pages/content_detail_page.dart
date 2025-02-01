import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/pages/bloc/comicsDetail_bloc.dart';

import 'comics/comic_detail_tabs.dart';

class ContentDetailPage extends StatelessWidget {
  // Peut être 'serie', 'movie' ou 'comic'
  final String type;

  const ContentDetailPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final itemId = args['itemId'];

    return Scaffold(
      body: _buildBody(itemId),
    );
  }

  Widget _buildBody(itemId) {
    if (type == 'comic') {
      return BlocProvider(
        create: (context) => ComicDetailBloc(itemId),
        child: BlocBuilder<ComicDetailBloc, ComicDetailState>(
          builder: (context, state) {
            if (state is ComicDetailNotifierLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ComicDetailNotifierSuccessState) {
              final comic = state.comic!;
              return ComicDetailTabs(comic: comic);
            } else if (state is ComicDetailNotifierErrorState) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text('Aucune donnée disponible.'));
            }
          },
        ),
      );
    } else {
      return const Center(child: Text('Données non reconnue.'));
    }
  }
}
