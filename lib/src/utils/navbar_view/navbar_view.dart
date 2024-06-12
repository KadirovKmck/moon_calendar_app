import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moon_calendar_app/src/presentation/prfile_view/prfile_view.dart';
import 'package:moon_calendar_app/src/presentation/statements_view/statements_view.dart';
import 'package:moon_calendar_app/src/presentation/weather_view/weather_view.dart';
import 'package:moon_calendar_app/src/utils/media_utils/media_utils.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  int _currentIndex = 0;
  List<Widget> views = [
    const WeatherView(),
    const StatementsView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaUtils.height(context);
    return Scaffold(
      body: views[_currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showUnselectedLabels: false,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFDD6F31),
        unselectedItemColor: Colors.black,
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
        selectedLabelStyle: const TextStyle(
          color: Color(0xFFDD6F31),
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/calendar1.svg',
              height: height * 0.035,
            ),
            label: 'Календарь',
            activeIcon: SvgPicture.asset(
              'assets/icons/calendar2.svg',
              height: height * 0.035,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/love1.svg',
              height: height * 0.035,
            ),
            label: 'Аффирмации',
            activeIcon: SvgPicture.asset(
              'assets/icons/love2.svg',
              height: height * 0.035,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/person2.svg',
              height: height * 0.035,
            ),
            label: 'Профиль',
            activeIcon: SvgPicture.asset(
              'assets/icons/person1.svg',
              height: height * 0.035,
            ),
          ),
        ],
      ),
    );
  }
}
