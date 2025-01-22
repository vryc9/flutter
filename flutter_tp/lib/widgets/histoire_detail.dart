import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HistoireDetailWidget extends StatelessWidget {
  final String content;

  const HistoireDetailWidget({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Html(
          data: content,
          style: {
            'body': Style(
              color: Colors.white,
              fontSize: FontSize.medium,
            ),
          },
        ),
      ),
    );
  }
}
