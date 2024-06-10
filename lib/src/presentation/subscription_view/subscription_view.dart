import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/presentation/splash_view/splash_view.dart';
import 'package:moon_calendar_app/src/utils/colors/colors.dart';
import 'package:moon_calendar_app/src/utils/media_utils/media_utils.dart';

class SubscriptionView extends StatefulWidget {
  const SubscriptionView({super.key});

  @override
  State<SubscriptionView> createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaUtils.height(context);
    final width = MediaUtils.width(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SplashView(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.orandge,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 249,
                      child: Text(
                        'Откройте все \nфункции Zhanat',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF595D62),
                          fontSize: 22,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.24,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 38),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16, vertical: height * 0.03),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: ShapeDecoration(
                              color: const Color(0x60DD6F31),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Image.asset(icons[index]),
                          ),
                          const SizedBox(width: 17),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title[index],
                                style: const TextStyle(
                                  color: Color(0xFF595D62),
                                  fontSize: 14,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.24,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                subTitle[index],
                                style: const TextStyle(
                                  color: Color(0xFFBDBDBD),
                                  fontSize: 11,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.24,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ClipPath(
                clipper: TopCurveClipper(),
                child: Container(
                  color: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 49,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 188,
                              height: 135,
                              decoration: ShapeDecoration(
                                color: Colors.white
                                    .withOpacity(0.4399999976158142),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              width: 188,
                              height: 135,
                              decoration: ShapeDecoration(
                                color: Colors.white
                                    .withOpacity(0.4399999976158142),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
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
            ],
          ),
        ),
      ),
    );
  }

  final title = <String>[
    'Полный Лунный календарь',
    'Лучшее время для 43 дел',
    'Индивидуальные расчеты',
    'Личные астрологические периоды',
  ];

  final subTitle = <String>[
    'Получайте рекомендации на каждый день',
    'Свидание, стрижка, шоппинг и тд.',
    'Анализ на основе ваших данных рождения',
    'Узнайте когда наступит пик продуктивности',
  ];

  final icons = <String>[
    'assets/images/moon.png',
    'assets/images/calendar.png',
    'assets/images/avatarButton.png',
    'assets/images/planetSaturn.png',
  ];
}

class SubscriptionOption extends StatelessWidget {
  final String price;
  final String period;

  const SubscriptionOption(
      {super.key, required this.price, required this.period});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            price,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.orange.shade700,
            ),
          ),
          Text(
            period,
            style: TextStyle(
              fontSize: 16,
              color: Colors.orange.shade700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 100); // Move to the point from where the curve should start
    var firstControlPoint = Offset(size.width / 2, 0);
    var firstEndPoint = Offset(size.width, 100);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
