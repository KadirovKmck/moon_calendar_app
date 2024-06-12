import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/utils/media_utils/media_utils.dart';

class ContainerUi extends StatelessWidget {
  final String text;

  const ContainerUi({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaUtils.height(context);
    final width = MediaUtils.width(context);
    return Container(
      width: width * 0.93,
      height: height * 0.065,
      decoration: ShapeDecoration(
        color: const Color(0xFFDD6F31),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: width * 0.04,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
