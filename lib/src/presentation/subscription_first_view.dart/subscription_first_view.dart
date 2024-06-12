import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/core/ui/widgets/function_subscription.dart';
import 'package:moon_calendar_app/src/presentation/auth/login_view/login_view.dart';
import 'package:moon_calendar_app/src/utils/media_utils/media_utils.dart';

class SubscriptionFirstView extends StatefulWidget {
  const SubscriptionFirstView({super.key});

  @override
  _SubscriptionFirstViewState createState() => _SubscriptionFirstViewState();
}

class _SubscriptionFirstViewState extends State<SubscriptionFirstView> {
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildHeader(context),
              SizedBox(height: height * 0.03),
              const FunctionSubscription(
                  icons: 'assets/images/moon.png',
                  titles: 'Полный Лунный календарь',
                  subTitles: 'Получайте рекомендации на каждый день'),
              SizedBox(height: height * 0.03),
              const FunctionSubscription(
                  icons: 'assets/images/calendar.png',
                  titles: 'Лучшее время для 43 дел',
                  subTitles: 'Свидание, стрижка, шоппинг и тд.'),
              SizedBox(height: height * 0.03),
              const FunctionSubscription(
                  icons: 'assets/images/avatarButton.png',
                  titles: 'Индивидуальные расчеты',
                  subTitles: 'Анализ на основе ваших данных рождения'),
              SizedBox(height: height * 0.03),
              const FunctionSubscription(
                  icons: 'assets/images/planetSaturn.png',
                  titles: 'Личные астрологические периоды',
                  subTitles: 'Узнайте когда наступит пик продуктивности'),
              _buildSubscriptionOptions(context)
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildHeader(BuildContext context) {
    final height = MediaUtils.height(context);
    final width = MediaUtils.width(context);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ),
              );
            },
            child: Container(
              height: height * 0.04,
              width: height * 0.04,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFDD6F31),
              ),
              child: Icon(
                Icons.close,
                size: height * 0.02,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: width * 0.05),
          const Text(
            '           Откройте все \n         функции Zhanat',
            style: TextStyle(
              color: Color(0xFF595D62),
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  ClipPath _buildSubscriptionOptions(BuildContext context) {
    final height = MediaUtils.height(context);
    final width = MediaUtils.width(context);

    return ClipPath(
      clipper: TopCurveClipper(),
      child: Container(
        height: height * 0.45,
        color: const Color(0xFFDD6F31),
        child: Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            children: [
              SizedBox(height: height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSubscriptionOption(
                    '299 Р',
                    'в месяц',
                    width,
                    height,
                  ),
                  _buildSubscriptionOption(
                    '3 дня бесплатно',
                    'затем 2390 Р в год',
                    width,
                    height,
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              const Text(
                'Подписку можно отменить в любой момент',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: height * 0.01),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                  );
                },
                child: Container(
                  width: width * 0.7,
                  height: height * 0.045,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFDD6F31),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Попробовать 3 дня бесплатно',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildFooterLink('Восстановить'),
                  _buildFooterLink('Условия'),
                  _buildFooterLink('Политика'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionOption(
      String price, String description, double width, double height) {
    return Container(
      width: width * 0.4,
      height: height * 0.15,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            price,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildFooterLink(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        decorationColor: Colors.white,
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.2);
    final firstControlPoint = Offset(size.width / 2, 0);
    final firstEndPoint = Offset(size.width, size.height * 0.2);
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
