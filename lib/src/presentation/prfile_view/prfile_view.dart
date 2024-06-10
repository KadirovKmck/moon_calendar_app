import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ClipPath(
            clipper: CustomAppBarClipper(),
            child: Container(
              height: 155,
              color: const Color(0xFFDD6F31),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      'Настройки',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/solar_exit-bold.svg',
                        fit: BoxFit.none,
                      ),
                    )
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
                    _buildOption(
                        icon: Icons.location_on, label: 'Ваша локация'),
                    _buildOption(icon: Icons.cake, label: 'Дата рождения'),
                  ],
                ),
                const SizedBox(height: 20),
                _buildSection(
                  title: 'Основное',
                  children: [
                    _buildListTile(
                        icon: const Icon(Icons.notifications,
                            color: Color(0xFFDD6F31)),
                        label: 'Уведомления'),
                    _buildListTile(
                        icon: SvgPicture.asset(
                          'assets/icons/solar_crown-bold.svg',
                        ),
                        label: 'Подписка'),
                  ],
                ),
                const SizedBox(height: 20),
                _buildSection(
                  title: 'Полезное',
                  children: [
                    _buildListTile(
                        icon: const Icon(Icons.info, color: Color(0xFFDD6F31)),
                        label: 'Справка'),
                    _buildListTile(
                        icon: const Icon(Icons.help, color: Color(0xFFDD6F31)),
                        label: 'Служба поддержки'),
                    _buildListTile(
                        icon: const Icon(Icons.description,
                            color: Color(0xFFDD6F31)),
                        label: 'О нас'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
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
        onTap: () {},
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
