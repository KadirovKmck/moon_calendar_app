import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/presentation/weather_view/view/activity_view/activity_view.dart';

class LegendRow extends StatelessWidget {
  const LegendRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LegendItem(color: Color(0xFFFFEB3B), text: "Лучший день"),
        LegendItem(color: Color(0xFF4CAF50), text: "Хороший день"),
        LegendItem(color: Color(0xFFF44336), text: "Плохой день"),
      ],
    );
  }
}
