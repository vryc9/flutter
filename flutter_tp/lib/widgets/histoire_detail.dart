import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HistoireDetailWidget extends StatelessWidget {
  final String content;

  const HistoireDetailWidget({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        // Met en forme le HTML reçu.
        child: Html(
          data: content,
          style: {
            'body': Style(
              fontSize: FontSize(17),
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          },
        ),
      ),
    );
  }
}
