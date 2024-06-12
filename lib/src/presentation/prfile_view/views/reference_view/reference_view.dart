import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/presentation/prfile_view/widget/custom_clipped_app_bar.dart';

class ReferenceView extends StatefulWidget {
  const ReferenceView({super.key});

  @override
  _ReferenceViewState createState() => _ReferenceViewState();
}

class _ReferenceViewState extends State<ReferenceView> {
  bool isCalendar = false;
  bool isSettlementday = false;
  bool isSubscription = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomClippedAppBar(
            text: '              Справка',
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isCalendar = !isCalendar;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 225, 225, 225)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('  Календарь', style: TextStyle(fontSize: 18)),
                        Icon(Icons.arrow_right,
                            size: 30, color: Color(0xFFDD6F31)),
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedCrossFade(
                  firstChild: Container(),
                  secondChild: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing',
                        style: TextStyle(fontSize: 16)),
                  ),
                  crossFadeState: isCalendar
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSettlementday = !isSettlementday;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 225, 225, 225)),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('  Расчет дней Экадаши',
                            style: TextStyle(fontSize: 18)),
                        Icon(Icons.arrow_right,
                            size: 30, color: Color(0xFFDD6F31)),
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedCrossFade(
                firstChild: Container(),
                secondChild: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: TextStyle(fontSize: 16))),
                crossFadeState: isSettlementday
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSubscription = !isSubscription;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 225, 225, 225)),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('  Подписка', style: TextStyle(fontSize: 18)),
                        Icon(
                          Icons.arrow_right,
                          size: 30,
                          color: Color(0xFFDD6F31),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedCrossFade(
                  firstChild: Container(),
                  secondChild: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: TextStyle(fontSize: 16)),
                  ),
                  crossFadeState: isSubscription
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300)),
            ],
          ),
        ],
      ),
    );
  }
}
