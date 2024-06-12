import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon_calendar_app/src/presentation/subscription_first_view.dart/subscription_first_view.dart';
import 'package:moon_calendar_app/src/utils/media_utils/media_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  double _progress = 0.25;

  void addProgress() {
    setState(() {
      if (_progress < 1.0) {
        _progress += 0.25;
      }
    });
    log('Progress: $_progress');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaUtils.height(context);
    final width = MediaUtils.width(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.83,
                  child: PageView.builder(
                    itemCount: titleList.length,
                    controller: _controller,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            width: 396,
                            child: Text(
                              titleList[index],
                              style: const TextStyle(
                                color: Color(0xFFDD6F31),
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 396,
                            child: Text(
                              subTitleList[index],
                              style: const TextStyle(
                                color: Color(0xFFBDBDBD),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 126,
                          ),
                          SvgPicture.asset(
                            onboardingIcons[index],
                            height: 269,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SmoothPageIndicator(
                          controller: _controller,
                          count: 4,
                          effect: const ExpandingDotsEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            activeDotColor: Color(0xFFDD6F31),
                            dotColor: Color.fromARGB(66, 196, 196, 196),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SubscriptionFirstView(),
                              ),
                            );
                          },
                          child: const Text(
                            'Пропустить',
                            style: TextStyle(
                              color: Color(0xFFDD6F31),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              decorationColor: Color(0xFFDD6F31),
                            ),
                          ),
                        )
                      ],
                    ),
                    CircularPercentIndicator(
                      percent: _progress,
                      radius: 35,
                      lineWidth: 4,
                      progressColor: const Color(0xFFDD6F31),
                      backgroundColor: const Color(0x60DD6F31),
                      center: GestureDetector(
                        onTap: () {
                          final nextPage = _controller.page!.toInt() + 1;
                          if (nextPage < titleList.length) {
                            _controller.animateToPage(
                              nextPage,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SubscriptionFirstView(),
                              ),
                            );
                            return;
                          }

                          addProgress();
                        },
                        child: Container(
                          width: 52,
                          height: 52,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFDD6F31),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final titleList = <String>[
    'Ежедневные подсказки Лунного календаря',
    'Поделитесь локацией для расчетов',
    'Обретите поддержку планет с Планировщиком',
    'Будьте на связи со Вселенной',
  ];
  final subTitleList = <String>[
    'Составляйте планы с учетом Лунных циклов и наблюдайте улучшения в своей продуктивности и отношениях с людьми',
    'Это необходимо, чтобы рекомендации Лунного Календаря были максимально точными',
    'Мы учитываем 34 астрологических фактора для расчетов самого удачного времени для начала проектов, стрижки волос, свиданий и других дел',
    'Мы будем сообщать о важных космических событиях, которые могут влиять на вашу жизнь: таких как Полнолуние или Затмение',
  ];
  final onboardingIcons = <String>[
    'assets/icons/onbording1.svg',
    'assets/icons/onbording2.svg',
    'assets/icons/onbording3.svg',
    'assets/icons/onbording4.svg',
  ];
}
