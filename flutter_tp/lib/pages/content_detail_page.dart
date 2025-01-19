import 'package:flutter/material.dart';

import '../model/comic_api.dart';
import 'comics/comic_detail_tabs.dart';

class ContentDetailPage extends StatelessWidget {
  final dynamic content; // Can be Comic, Movie, or Serie.

  const ContentDetailPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    Widget contentTabs;
    /*
    if (content is Comic) {
      contentTabs = ComicDetailTabs(comic: content as Comic);
    } else if (content is Movie) {
      contentTabs = MovieDetailTabs(movie: content as Movie);
    } else if (content is Serie) {
      contentTabs = SerieDetailTabs(serie: content as Serie);
    } else {
      contentTabs = const Center(child: Text('Unknown content type'));
    }
    */

    if (content is Comic) {
      contentTabs = ComicDetailTabs(comic: content as Comic);
    } else {
      contentTabs = const Center(child: Text('WTF'));
    }

    return Scaffold(
      appBar: AppBar(title: Text(content.title ?? 'Details')),
      body: contentTabs,
    );
  }
}
