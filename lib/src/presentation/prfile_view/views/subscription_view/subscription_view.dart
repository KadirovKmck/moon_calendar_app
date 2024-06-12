import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/core/ui/widgets/function_subscription.dart';
import 'package:moon_calendar_app/src/presentation/auth/login_view/login_view.dart';
import 'package:moon_calendar_app/src/presentation/prfile_view/widget/custom_clipped_app_bar.dart';
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
              const CustomClippedAppBar(
                text: '             Подписка',
              ),
              SizedBox(
                height: height * 0.0579,
              ),
              const FunctionSubscription(
                icons: 'assets/images/moon.png',
                titles: 'Полный Лунный календарь',
                subTitles: 'Получайте рекомендации на каждый день',
              ),
              const SizedBox(
                height: 15,
              ),
              const FunctionSubscription(
                icons: 'assets/images/calendar.png',
                titles: 'Лучшее время для 43 дел',
                subTitles: 'Свидание, стрижка, шоппинг и тд.',
              ),
              const SizedBox(
                height: 15,
              ),
              const FunctionSubscription(
                icons: 'assets/images/avatarButton.png',
                titles: 'Индивидуальные расчеты',
                subTitles: 'Анализ на основе ваших данных рождения',
              ),
              const SizedBox(
                height: 15,
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

  ClipPath _buildSubscriptionOptions() {
    return ClipPath(
      clipper: TopCurveClipper(),
      child: Container(
        height: 423,
        color: const Color(0xFFDD6F31),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 85,
              ),
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
              const SizedBox(height: 28),
              const Text(
                'Подписку можно отменить в любой момент',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
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
                        fontWeight: FontWeight.w700,
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
      width: 178,
      height: 125,
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
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.underline,
        decorationColor: Colors.white,
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
