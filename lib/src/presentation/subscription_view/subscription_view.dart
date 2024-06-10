import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/presentation/auth/login_view/login_view.dart';
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
              _buildHeader(context),
              const SizedBox(height: 38),
              const FunctionSubscription(
                icons: 'assets/images/moon.png',
                titles: 'Полный Лунный календарь',
                subTitles: 'Получайте рекомендации на каждый день',
              ),
              const SizedBox(
                height: 28,
              ),
              const FunctionSubscription(
                icons: 'assets/images/calendar.png',
                titles: 'Лучшее время для 43 дел',
                subTitles: 'Свидание, стрижка, шоппинг и тд.',
              ),
              const SizedBox(
                height: 28,
              ),
              const FunctionSubscription(
                icons: 'assets/images/avatarButton.png',
                titles: 'Индивидуальные расчеты',
                subTitles: 'Анализ на основе ваших данных рождения',
              ),
              const SizedBox(
                height: 28.45,
              ),
              const FunctionSubscription(
                icons: 'assets/images/planetSaturn.png',
                titles: 'Личные астрологические периоды',
                subTitles: 'Узнайте когда наступит пик продуктивности',
              ),
              _buildSubscriptionOptions(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
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
              height: 35,
              width: 35,
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
          const SizedBox(width: 20),
          const Expanded(
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
          ),
        ],
      ),
    );
  }

  ClipPath _buildSubscriptionOptions() {
    return ClipPath(
      clipper: TopCurveClipper(),
      child: Container(
        color: const Color(0xFFDD6F31),
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 59),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSubscriptionOption(
                    '299 Р',
                    'в месяц',
                  ),
                  _buildSubscriptionOption(
                    '3 дня бесплатно',
                    'затем 2390 Р в s',
                  ),
                ],
              ),
              const SizedBox(height: 23),
              const Text(
                'Подписку можно отменить в любой момент',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.24,
                ),
              ),
              const SizedBox(height: 25),
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
                  width: 396,
                  height: 56,
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
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
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

  Widget _buildSubscriptionOption(String price, String description) {
    return Container(
      width: 188,
      height: 135,
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
              fontSize: 14,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w700,
              letterSpacing: 0.24,
            ),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.24,
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
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.underline,
        decorationColor: Colors.white,
      ),
    );
  }
}

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.24,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subTitles,
                style: const TextStyle(
                  color: Color(0xFFBDBDBD),
                  fontSize: 11,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 100);
    final firstControlPoint = Offset(size.width / 2, 0);
    final firstEndPoint = Offset(size.width, 100);
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
