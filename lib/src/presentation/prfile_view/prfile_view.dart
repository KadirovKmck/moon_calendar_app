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
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Column(
      children: [
        ClipPath(
          clipper: CustomAppBarClipper(),
          child: Container(
            height: screenHeight * 0.2,
            color: const Color(0xFFDD6F31),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Настройки',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.24,
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.1,
                    height: screenWidth * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.17),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.01),
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
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LocationView()),
                        );
                      },
                      child: _buildOption(
                        icon: Icons.location_on,
                        label: 'Ваша локация',
                        context: context,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BirthDateScreen()),
                        );
                      },
                      child: _buildOption(
                        icon: Icons.cake,
                        label: 'Дата рождения',
                        context: context,
                      ),
                    ),
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
                              builder: (context) => const NotificationView()),
                        );
                      },
                      child: _buildListTile(
                        icon: const Icon(Icons.notifications,
                            color: Color(0xFFDD6F31)),
                        label: 'Уведомления',
                        context: context,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SubscriptionView()),
                        );
                      },
                      child: _buildListTile(
                        icon: SvgPicture.asset(
                          'assets/icons/solar_crown-bold.svg',
                          color: const Color(0xFFDD6F31),
                        ),
                        label: 'Подписка',
                        context: context,
                      ),
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
                              builder: (context) => const ReferenceView()),
                        );
                      },
                      child: _buildListTile(
                        icon: const Icon(Icons.info, color: Color(0xFFDD6F31)),
                        label: 'Справка',
                        context: context,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SupportServiceView()),
                        );
                      },
                      child: _buildListTile(
                        icon: const Icon(Icons.help, color: Color(0xFFDD6F31)),
                        label: 'Служба поддержки',
                        context: context,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutUsView()),
                        );
                      },
                      child: _buildListTile(
                        icon: const Icon(Icons.description,
                            color: Color(0xFFDD6F31)),
                        label: 'О нас',
                        context: context,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOption({
    required IconData icon,
    required String label,
    required BuildContext context,
  }) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.12,
      width: screenWidth * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0x0CDD6F31),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon,
                color: const Color(0xFFDD6F31), size: screenHeight * 0.04),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                  fontSize: screenHeight * 0.015, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: screenHeight * 0.025,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade500,
          ),
        ),
        const SizedBox(height: 8),
        ...children,
      ],
    );
  }

  Widget _buildListTile({
    required Widget icon,
    required String label,
    required BuildContext context,
  }) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.08,
      width: screenWidth * 0.95,
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
