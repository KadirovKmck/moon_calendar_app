import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/presentation/weather_view/widget/activity_item.dart';

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
