import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon_calendar_app/src/presentation/splash_view/splash_view.dart';
import 'package:moon_calendar_app/src/utils/colors/colors.dart';
import 'package:moon_calendar_app/src/utils/media_utils/media_utils.dart';

class SubscriptionView extends StatelessWidget {
  const SubscriptionView({super.key});

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
                        // height: 15,
                        // width: 15,
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
              const SizedBox(
                height: 38,
              ),
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
                            child: Image.asset('assets/icons/moon.png'),
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Полный Лунный календарь',
                                style: TextStyle(
                                  color: Color(0xFF595D62),
                                  fontSize: 14,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.24,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Получайте рекомендации на каждый день',
                                style: TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}
