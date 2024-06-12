import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moon_calendar_app/src/presentation/weather_view/widget/animated_cross_fade_widget.dart';
import 'package:moon_calendar_app/src/presentation/weather_view/widget/colander_page.dart';
import 'package:moon_calendar_app/src/presentation/weather_view/widget/legend_row.dart';

<<<<<<< HEAD
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

=======
>>>>>>> main
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

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ClipPath(
              clipper: CustomAppBarClipper(),
              child: Container(
                height: 500,
                color: const Color(0xFFDD6F31), // Orange color
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_left_outlined,
                                size: 50, color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Text(
                            '      Деловые сделки',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      _buildHeader(),
                      const SizedBox(height: 16.0),
                      _buildCalendar(),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: _selectedDay != null
                  ? _buildDayDetails(_selectedDay!)
                  : const Center(
                      child: Text(
                        'Выберите дату для просмотра деталей.',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      calendarStyle: const CalendarStyle(
        defaultTextStyle: TextStyle(color: Colors.white),
        weekendTextStyle: TextStyle(color: Colors.white),
        outsideDaysVisible: false,
        todayDecoration: BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
      headerVisible: false,
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: Colors.white),
        weekendStyle: TextStyle(color: Colors.white),
      ),
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, date, events) {
          return _buildMarker(date);
        },
      ),
    );
  }

  Widget _buildDayDetails(DateTime date) {
    String dayDescription;
    int dayScore;

    // Sample logic to determine description and score based on the date
    if (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday) {
      dayDescription = 'Сегодня - выходной день';
      dayScore = 7;
    } else {
      dayDescription = 'Сегодня - нейтральный день';
      dayScore = 4;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  '${date.day} ${_getMonthName(date.month)}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF595D62),
                    fontSize: 24,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '$dayDescription\n($dayScore из 10 баллов)',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFBDBDBD),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Деловые сделки - заключение договоров и контрактов, оформление документов, деловые встречи и совещания, финансовые операции и любые важные действия.',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    const List<String> months = [
      'Январь',
      'Февраль',
      'Март',
      'Апрель',
      'Май',
      'Июнь',
      'Июль',
      'Август',
      'Сентябрь',
      'Октябрь',
      'Ноябрь',
      'Декабрь'
    ];
    return months[month - 1];
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_left,
            color: Colors.white,
            size: 50,
          ),
          onPressed: () {
            setState(() {
              _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1);
            });
          },
        ),
        Text(
          '${_getMonthName(_focusedDay.month)} ${_focusedDay.year}',
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        IconButton(
          icon: const Icon(
            Icons.arrow_right,
            color: Colors.white,
            size: 50,
          ),
          onPressed: () {
            setState(() {
              _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1);
            });
          },
        ),
      ],
    );
  }

  Widget _buildMarker(DateTime date) {
    final markers = [
      Colors.red,
      Colors.green,
      Colors.blue,
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(markers.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 1.0),
          decoration: BoxDecoration(
            color: markers[index],
            shape: BoxShape.circle,
          ),
          width: 5.0,
          height: 5.0,
        );
      }),
    );
  }
}
