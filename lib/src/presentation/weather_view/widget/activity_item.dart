import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  final String title;

  const ActivityItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(255, 217, 217, 217)),
      ),
      child: Center(child: Text(title)),
    );
  }
}