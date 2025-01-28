import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/pages/generic_list.dart';
import 'package:flutter_tp/pages/home_screen.dart';
import 'package:flutter_tp/pages/search_screen.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';

class MainNavigationBar extends StatefulWidget {
  final Widget? child;
  final int initialIndex;

  const MainNavigationBar({
    Key? key,
    this.child,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  static const List<Widget> _pages = [
    HomeScreen(),
    GenericListScreen(type: "comic"),
    GenericListScreen(type: "serie"),
    GenericListScreen(type: "movie"),
    SearchScreen(),
  ];

  static const List<String> _svgIcons = [
    AppVectorialImages.navbarHome,
    AppVectorialImages.navbarComics,
    AppVectorialImages.navbarSeries,
    AppVectorialImages.navbarMovies,
    AppVectorialImages.navbarSearch,
  ];

  static const List<String> _labels = [
    "Accueil",
    "Comics",
    "Séries",
    "Films",
    "Recherche",
  ];

  void _onItemTapped(int index) {
    if (widget.child != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainNavigationBar(initialIndex: index),
        ),
      );
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: widget.child ??
          IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: AppColors.bottomBarBackground,
        ),
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_svgIcons.length, (index) {
              return _NavItem(
                iconPath: _svgIcons[index],
                label: _labels[index],
                isActive: index == _currentIndex,
                onTap: () => _onItemTapped(index),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: isActive
            ? BoxDecoration(
                color: AppColors.bottomBarBackgroundSelected.withOpacity(0.08),
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                isActive
                    ? AppColors.bottomBarTextSelected
                    : AppColors.bottomBarTextUnselected,
                BlendMode.srcIn,
              ),
              width: 24,
              height: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive
                    ? AppColors.bottomBarTextSelected
                    : AppColors.bottomBarTextUnselected,
                fontSize: 11,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
