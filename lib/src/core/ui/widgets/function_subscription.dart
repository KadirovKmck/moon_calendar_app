import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/utils/media_utils/media_utils.dart';

class FunctionSubscription extends StatelessWidget {
  const FunctionSubscription({
    super.key,
    required this.icons,
    required this.titles,
    required this.subTitles,
  });
  final String icons;
  final String titles;
  final String subTitles;

  @override
  Widget build(BuildContext context) {
    final w = MediaUtils.width(context);
    final h = MediaUtils.height(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: ShapeDecoration(
              color: const Color(0x60DD6F31),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Image.asset(icons),
          ),
          const SizedBox(width: 17),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titles,
                style: const TextStyle(
                  color: Color(0xFF595D62),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subTitles,
                style: const TextStyle(
                  color: Color(0xFFBDBDBD),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
