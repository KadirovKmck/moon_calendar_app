import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moon_calendar_app/src/presentation/weather_view/calendar_page.dart';
import 'package:moon_calendar_app/src/presentation/weather_view/view/activity_view/activity_view.dart';
import 'package:moon_calendar_app/src/presentation/weather_view/view/description_view/description_view.dart';
import 'package:moon_calendar_app/src/presentation/weather_view/view/periods_view/periods_view.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            ClipPath(
              clipper: CustomAppBarClipper(),
              child: Container(
                height: 175,
                decoration: const BoxDecoration(
                  color: Color(0xFFDD6F31),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text:
                                '              28-й \n                Лунный день\n ',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '                     Луна в Козероге',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100, bottom: 40),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CalendarPage(),
                                ),
                              );
                            },
                            child: Container(
                              width: 46,
                              height: 46,
                              decoration: ShapeDecoration(
                                color: Colors.white.withOpacity(0.16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/icons/calendar1.svg',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_left_outlined,
                    size: 50,
                    color: Color(0xFFDD6F31),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '8 марта, пт',
                    style: TextStyle(
                      color: Color(0xFF595D62),
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_right,
                    size: 50,
                    color: Color(0xFFDD6F31),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 43,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return  Container(
                      height: 50,
                      width: 360,
                    );
                  },
                ),
              ),
            ),
            // TabBar(
            //   controller: _tabController,
            //   labelColor: const Color(0xFFDD6F31),
            //   unselectedLabelColor: Colors.grey,
            //   indicatorColor: const Color(0xFFDD6F31),
            //   tabs: const [
            //     Card(
            //       child: Text('Activity'),
            //     ),
            //     Tab(text: 'Description'),
            //     Tab(text: 'Periods'),
            //   ],
            // ),
            // Expanded(
            //   child: TabBarView(
            //     controller: _tabController,
            //     children: const [
            //       DescriptionView(),
            //       ActivityView(),
            //       PeriodsView(),
            //     ],
            //   ),
            // ),
          ],
        ),
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
