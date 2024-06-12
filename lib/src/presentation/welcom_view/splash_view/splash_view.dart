import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/core/ui/widgets/container_ui.dart';
import 'package:moon_calendar_app/src/presentation/welcom_view/onboarding_view/onboarding_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 271,
                height: 260,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/i.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Column(
                children: [
                  Text(
                    'Добро пожаловать в \nZhanat',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xFF595D62),
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
                    'Укрепите контакт с собой и\n улучшите жизнь с помощью \nвосточной астрологии',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFBDBDBD),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingView(),
                    ),
                  );
                },
                child: const ContainerUi(
                  text: 'Начать',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
