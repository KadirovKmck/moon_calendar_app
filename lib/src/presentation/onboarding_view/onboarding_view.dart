// import 'package:flutter/material.dart';
// import 'package:moon_calendar_app/src/presentation/splash_view/splash_view.dart';
// import 'package:moon_calendar_app/src/utils/media_utils/media_utils.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class QuestionView extends StatefulWidget {
//   const QuestionView({super.key});

//   @override
//   State<QuestionView> createState() => _QuestionViewState();
// }

// class _QuestionViewState extends State<QuestionView> {
//   final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);

//   @override
//   void dispose() {
//     _controller.dispose();
//     _selectedIndexNotifier.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(
//             horizontal: width * 0.020, vertical: height * 0.050),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             _buildPageIndicator(),
//             SizedBox(height: height * 0.040),
//             _buildPageView(),
//             SizedBox(height: height * 0.200),
//             _buildContinueButton(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPageIndicator() {
//     return Center(
//       child: SmoothPageIndicator(
//         controller: _controller,
//         count: QuestionsText().questionsList.length,
//         effect: const JumpingDotEffect(
//           dotHeight: 10,
//           dotWidth: 10,
//           activeDotColor: Color(0xff4C9FFC),
//           dotColor: Color.fromARGB(160, 76, 158, 252),
//           verticalOffset: 25,
//         ),
//       ),
//     );
//   }

//   Widget _buildPageView() {
//     return SizedBox(
//       height: 470,
//       child: PageView.builder(
//         controller: _controller,
//         itemCount: QuestionsText().questionsList.length,
//         itemBuilder: (context, pageIndex) {
//           return _buildQuestionPage(pageIndex);
//         },
//       ),
//     );
//   }

//   Widget _buildQuestionPage(int pageIndex) {
//     final questionsText = QuestionsText().questionsList;
//     final answers = [
//       QuestionsAnswers().fistColum,
//       QuestionsAnswers().secondColum,
//       QuestionsAnswers().threedColum,
//       QuestionsAnswers().fourColum
//     ];

//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Column(
//       children: [
//         SizedBox(
//           height: height * 0.155,
//           child: Text(
//             questionsText[pageIndex],
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: width * 0.048,
//               fontFamily: 'SF Pro Text',
//               fontWeight: FontWeight.w600,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         const SizedBox(height: 55),
//         Expanded(
//           child: ValueListenableBuilder<int>(
//             valueListenable: _selectedIndexNotifier,
//             builder: (context, selectedIndex, child) {
//               return Column(
//                 children: List.generate(answers.length, (answerIndex) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: CoteineerQuestion(
//                       title: answers[answerIndex][pageIndex],
//                       onTap: () {
//                         _selectedIndexNotifier.value = answerIndex;
//                       },
//                       side: BorderSide(
//                         color: selectedIndex == answerIndex
//                             ? const Color(0xFFCACCFF)
//                             : Colors.transparent,
//                       ),
//                     ),
//                   );
//                 }),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildContinueButton() {
//     return ConteinerUi(
//       name: 'Continue',
//       onTap: () {
//         final nextPage = _controller.page!.toInt() + 1;
//         if (nextPage < QuestionsText().questionsList.length) {
//           _controller.animateToPage(
//             nextPage,
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//           );
//         } else {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const SplashView(),
//             ),
//           );
//         }
//       },
//     );
//   }
// }

// class QuestionsText {
//   final questionsList = <String>[
//     'What types of subscription services are you interested in monitoring with our app?',
//     'How often do you typically subscribe to new services?',
//     'What features are you looking for in a subscription monitoring app?',
//     'How many subscription services do you currently use?',
//     'Which platforms do you primarily use for subscribing to services?',
//     'What challenges do you face in managing your current subscriptions?',
//     'How important is it for you to have access to historical subscription data?',
//     'Would you prefer a free version of the app with limited features or a paid version with premium features?',
//     'Do you prefer receiving notifications via email, push notifications, or both?',
//     'Are you interested in community features such as sharing subscription recommendations or tips?',
//   ];
// }

// class ConteinerUi extends StatelessWidget {
//   const ConteinerUi({super.key, required this.name, required this.onTap});
//   final String name;
//   final Function() onTap;
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: width * 0.843,
//         height: height * 0.041,
//         padding: const EdgeInsets.all(10),
//         decoration: ShapeDecoration(
//           gradient: const LinearGradient(
//             begin: Alignment(1.00, 0.00),
//             end: Alignment(-1, 0),
//             colors: [Color(0xFF4CA1FE), Color(0xFF32338D)],
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           shadows: const [
//             BoxShadow(
//               color: Color(0x7F04041A),
//               blurRadius: 6,
//               offset: Offset(0, 4),
//               spreadRadius: 0,
//             )
//           ],
//         ),
//         child: Center(
//           child: Text(
//             name,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: width * 0.045,
//               fontWeight: FontWeight.w600,
//               height: 0.05,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class QuestionsAnswers {
//   final fistColum = <String>[
//     'Movies',
//     'Monthly',
//     'Automated renewal reminders',
//     '1-3',
//     'iOS',
//     'Forgetting renewal dates',
//     'Very important',
//     'Free version',
//     'Email',
//     'Yes, definitely',
//   ];
//   final secondColum = <String>[
//     'Music',
//     'Quarterly',
//     'Expense tracking',
//     '4-6',
//     'Android',
//     'Difficulty tracking expenses',
//     'Somewhat important',
//     'Paid version',
//     'Push notifications',
//     'Maybe, if theyre useful',
//   ];
//   final threedColum = <String>[
//     'Video games',
//     'Yearly',
//     'Customizable alerts',
//     '7-9',
//     'Web-based',
//     'Subscription overload',
//     'Not very important',
//     'Either, depending on features',
//     'Both',
//     'No, not interested',
//   ];
//   final fourColum = <String>[
//     'Others',
//     'Occasionally',
//     'Integration with calendar apps',
//     '10+',
//     'Others',
//     'Others',
//     'Not important at all',
//     'Im not sure',
//     'Neither',
//     'Im not sure yet',
//   ];
// }

// class CoteineerQuestion extends StatelessWidget {
//   const CoteineerQuestion(
//       {super.key, required this.title, this.onTap, required this.side});
//   final String title;
//   final Function()? onTap;
//   final BorderSide side;
//   @override
//   Widget build(BuildContext context) {
//     final heidth = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: heidth * 0.4,
//         height: width * 0.082,
//         padding: const EdgeInsets.all(10),
//         decoration: ShapeDecoration(
//           color: const Color(0x7F4B9CF9),
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12), side: side),
//           shadows: const [
//             BoxShadow(
//               color: Color(0x3F000000),
//               blurRadius: 4,
//               offset: Offset(0, 4),
//               spreadRadius: 0,
//             )
//           ],
//         ),
//         child: Center(
//           child: Text(
//             title,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: width * 0.038,
//               fontFamily: 'SF Pro Display',
//               fontWeight: FontWeight.w500,
//               height: 0.05,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon_calendar_app/src/presentation/subscription_view/subscription_view.dart';
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.24,
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
                                  fontFamily: 'DM Sans',
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
                                      const SubscriptionView(),
                                ),
                              );
                            },
                            child: const Text(
                              'Пропустить',
                              style: TextStyle(
                                color: Color(0xFFDD6F31),
                                fontSize: 18,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
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
                        circularStrokeCap: CircularStrokeCap.round,
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
                                      const SubscriptionView(),
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
