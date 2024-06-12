import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
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
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: CustomAppBarClipper(),
            child: Container(
              height: 530,
              color: const Color(0xFFDD6F31),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_left_outlined,
                            size: 50,
                            color: Colors.white,
                          ),
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
              _focusedDay = DateTime(
                _focusedDay.year,
                _focusedDay.month - 1,
              );
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
              _focusedDay = DateTime(
                _focusedDay.year,
                _focusedDay.month + 1,
              );
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
