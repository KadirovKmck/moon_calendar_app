import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/presentation/prfile_view/widget/custom_clipped_app_bar.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  _AboutUsViewState createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomClippedAppBar(
            text: '                 О нас',
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Zhanat помогает обрести внутреннюю гармонию и\nулучшить все сферы жизни с помощью\nинструментов восточной астрологии и древних\nсакральных знаний',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0x0CDD6F31),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading:
                                const Icon(Icons.update, color: Colors.orange),
                            title: const Text('Новая версия'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {},
                          ),
                          ListTile(
                            leading:
                                const Icon(Icons.share, color: Colors.orange),
                            title: const Text('Поделиться приложением'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.language,
                                color: Colors.orange),
                            title: const Text('Наш сайт'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset('assets/images/fire.png', height: 100),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
