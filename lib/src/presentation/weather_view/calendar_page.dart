import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moon_calendar_app/src/presentation/weather_view/widget/animated_cross_fade_widget.dart';
import 'package:moon_calendar_app/src/presentation/weather_view/widget/colander_page.dart';
import 'package:moon_calendar_app/src/presentation/weather_view/widget/legend_row.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  bool isCalendar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: CustomAppBarClipper(),
            child: Container(
              height: 155,
              decoration: const BoxDecoration(
                color: Color(0xFFDD6F31),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_left_outlined,
                            size: 50, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        'Выберите активность',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/calendar1.svg',
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: LegendRow(),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isCalendar = !isCalendar;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color(0x0CDD6F31),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.business_center),
                      color: const Color(0xFFDD6F31),
                    ),
                    const Text(
                      'Деловая активность',
                      style: TextStyle(
                        color: Color(0xFF595D62),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(
                      isCalendar ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      size: 30,
                      color: const Color(0xFFDD6F31),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedCrossFadeWidget(isCalendar: isCalendar),
          const SizedBox(height: 10),
          const ColanderPage(
            text: 'Красота',
          ),
          const SizedBox(height: 15),
          const ColanderPage(
            text: 'Обучение и творчество',
          ),
          const SizedBox(height: 15),
          const ColanderPage(
            text: 'Здоровье',
          ),
          const SizedBox(height: 15),
          const ColanderPage(
            text: 'Дом',
          ),
          const SizedBox(height: 15),
          const ColanderPage(
            text: 'Отношения',
          ),
          const SizedBox(height: 15),
          const ColanderPage(
            text: 'Дети',
          ),
        ],
      ),
    );
  }
}

class CustomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
