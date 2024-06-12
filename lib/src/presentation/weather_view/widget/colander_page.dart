import 'package:flutter/material.dart';

class ColanderPage extends StatelessWidget {
  const ColanderPage({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385,
      height: 50,
      decoration: ShapeDecoration(
        color: const Color(0x0CDD6F31),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF595D62),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Icon(
            Icons.arrow_drop_down,
            size: 30,
            color: Color(0xFFDD6F31),
          ),
        ],
      ),
    );
  }
}