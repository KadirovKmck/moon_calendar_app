import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterWithGoogle extends StatelessWidget {
  const RegisterWithGoogle({
    super.key,
    required this.text,
    required this.onPressed,
    required this.svgPicture,
    required this.width, // Add width parameter
  });

  final String text;
  final VoidCallback onPressed;
  final String svgPicture;
  final double width; // Add width parameter

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Use width parameter
      height: 56, // Keep height fixed for now, adjust if needed
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFFE2E2E2)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                SvgPicture.asset(
                  svgPicture,
                  width: 24, // Keep icon size fixed for now, adjust if needed
                  height: 24,
                ),
                const SizedBox(width: 15),
                Text(
                  text,
                  style: TextStyle(
                    color: const Color(0xFFDD6F31),
                    fontSize:
                        width * 0.04, // Adjust font size based on screen size
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
