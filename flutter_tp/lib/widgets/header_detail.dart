import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';

class HeaderWidget extends StatelessWidget {
  final String title;

  const HeaderWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.transparent,
        ),
        ),
        Positioned(
          left: 16,
          top: 16 + MediaQuery.of(context).padding.top,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  AppVectorialImages.icBack,    
                  height: 24.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              const SizedBox(width: 14),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}