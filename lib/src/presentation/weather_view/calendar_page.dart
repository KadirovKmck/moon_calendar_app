import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moon_calendar_app/src/presentation/weather_view/widget/legend_row.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  bool isCalendar = false;
  final isOpen = List.filled(7, false);
  final name = <String>[
    'jj',
    'hh',
    'smmd',
    'smms',
    'smms',
    'smms',
    'smms',
  ];
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: LegendRow(),
          ),
          ListView.builder(
            itemCount: name.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isOpen[index] = !isOpen[index];
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
                        Text(
                          name[index],
                          style: const TextStyle(
                            color: Color(0xFF595D62),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          isOpen[index]
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          size: 30,
                          color: const Color(0xFFDD6F31),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          AnimatedCrossFadeWidget(isCalendar: isCalendar),
        ],
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
        padding: EdgeInsets.all(8.0),
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

class ActivityItem extends StatelessWidget {
  final String title;

  const ActivityItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(255, 217, 217, 217)),
      ),
      child: Center(child: Text(title)),
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
