import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moon_calendar_app/src/presentation/weather_view/view/activity_view/activity_view.dart';

class CalendarPage1 extends StatefulWidget {
  const CalendarPage1({super.key});

  @override
  _CalendarPage1State createState() => _CalendarPage1State();
}

class _CalendarPage1State extends State<CalendarPage1> {
  bool isCalendar = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ClipPath(
            clipper: CustomAppBarClipper(),
            child: Container(
              height: height * 0.23,
              width: width,
              decoration: const BoxDecoration(
                color: Color(0xFFDD6F31),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back,
                          size: 30, color: Colors.white),
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                    const Expanded(
                      child: Text(
                        'Деловая активность',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF595D62),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
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
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: const [
                ColanderPage(text: 'Красота'),
                SizedBox(height: 15),
                ColanderPage(text: 'Обучение и творчество'),
                SizedBox(height: 15),
                ColanderPage(text: 'Здоровье'),
                SizedBox(height: 15),
                ColanderPage(text: 'Дом'),
                SizedBox(height: 15),
                ColanderPage(text: 'Отношения'),
                SizedBox(height: 15),
                ColanderPage(text: 'Дети'),
              ],
            ),
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

class ActivityItem extends StatelessWidget {
  final String title;

  const ActivityItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFD9D9D9)),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF595D62),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class AnimatedCrossFadeWidget extends StatelessWidget {
  final bool isCalendar;

  const AnimatedCrossFadeWidget({super.key, required this.isCalendar});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Container(),
      secondChild: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            ActivityItem(title: 'Деловые сделки'),
            SizedBox(height: 10),
            ActivityItem(title: 'Крупная покупка'),
            SizedBox(height: 10),
            ActivityItem(title: 'Начало проекта/бизнеса'),
          ],
        ),
      ),
      crossFadeState:
          isCalendar ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 300),
    );
  }
}

class ColanderPage extends StatelessWidget {
  const ColanderPage({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0x0CDD6F31),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF595D62),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Icon(
            Icons.arrow_drop_down,
            size: 30,
            color: Color(0xFFDD6F31),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
