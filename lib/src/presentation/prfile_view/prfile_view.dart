import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moon_calendar_app/src/presentation/prfile_view/views/about_us_view/about_us_view.dart';
import 'package:moon_calendar_app/src/presentation/prfile_view/views/date_of_birth./date_of_birth_view.dart';
import 'package:moon_calendar_app/src/presentation/prfile_view/views/location_view/location_view.dart';
import 'package:moon_calendar_app/src/presentation/prfile_view/views/notification_view/notification_view.dart';
import 'package:moon_calendar_app/src/presentation/prfile_view/views/reference_view/reference_view.dart';
import 'package:moon_calendar_app/src/presentation/prfile_view/views/subscription_view/subscription_view.dart';
import 'package:moon_calendar_app/src/presentation/prfile_view/views/support_service_view/support_service_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: CustomAppBarClipper(),
          child: Container(
            height: 155,
            color: const Color(0xFFDD6F31),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Настройки',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      height: 0.04,
                      letterSpacing: 0.24,
                    ),
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        'assets/icons/solar--exit-bold.svg',
                        color: Colors.white,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LocationView()));
                      },
                      child: _buildOption(
                          icon: Icons.location_on, label: 'Ваша локация')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BirthDateScreen()));
                      },
                      child: _buildOption(
                          icon: Icons.cake, label: 'Дата рождения')),
                ],
              ),
              const SizedBox(height: 20),
              _buildSection(
                title: 'Основное',
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NotificationView()));
                    },
                    child: _buildListTile(
                        icon: const Icon(Icons.notifications,
                            color: Color(0xFFDD6F31)),
                        label: 'Уведомления'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SubscriptionView()));
                    },
                    child: _buildListTile(
                        icon: SvgPicture.asset(
                          'assets/icons/solar_crown-bold.svg',
                        ),
                        label: 'Подписка'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildSection(
                title: 'Полезное',
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ReferenceView()));
                    },
                    child: _buildListTile(
                        icon: const Icon(Icons.info, color: Color(0xFFDD6F31)),
                        label: 'Справка'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SupportServiceView()));
                    },
                    child: _buildListTile(
                        icon: const Icon(Icons.help, color: Color(0xFFDD6F31)),
                        label: 'Служба поддержки'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutUsView()));
                    },
                    child: _buildListTile(
                        icon: const Icon(Icons.description,
                            color: Color(0xFFDD6F31)),
                        label: 'О нас'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOption({required IconData icon, required String label}) {
    return Container(
      height: 100,
      width: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0x0CDD6F31),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFFDD6F31), size: 30),
            const SizedBox(height: 8),
            Text(label,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      {required String title, required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade500,
          ),
        ),
        const SizedBox(height: 8),
        ...children,
      ],
    );
  }

  Widget _buildListTile({required Widget icon, required String label}) {
    return Container(
      height: 60,
      width: 365,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0x0CDD6F31),
      ),
      child: ListTile(
        leading: icon,
        title: Text(label),
        trailing: const Icon(
          Icons.arrow_right,
          size: 35,
          color: Color(0xFFD9D9D9),
        ),
      ),
    );
  }
}

class CustomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
