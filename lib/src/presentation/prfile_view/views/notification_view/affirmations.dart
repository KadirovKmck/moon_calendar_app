import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/presentation/prfile_view/widget/custom_clipped_app_bar.dart';

class AffirmationsView extends StatefulWidget {
  const AffirmationsView({super.key});

  @override
  State<AffirmationsView> createState() => _AffirmationsViewState();
}

class _AffirmationsViewState extends State<AffirmationsView> {
  bool oneDayBefore = true;
  bool onEventDay = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomClippedAppBar(
            text: '          Аффирмации',
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0x0CDD6F31),
              ),
              child: Column(
                children: [
                  _buildNotificationSetting('Утреннее повторение', oneDayBefore,
                      (bool value) {
                    setState(() {
                      oneDayBefore = value;
                    });
                  }),
                  _buildTimeSetting('Время уведомдения', '10:00'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0x0CDD6F31),
              ),
              child: Column(
                children: [
                  _buildNotificationSetting('Вечернее повторение', onEventDay,
                      (bool value) {
                    setState(() {
                      onEventDay = value;
                    });
                  }),
                  _buildTimeSetting('Время уведомдения', '19:00'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 100,
            width: 380,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color.fromARGB(255, 198, 198, 198))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/images/woman.png'),
                const Text(
                  'Целительная сила аффирмации вырастает \nкаждым повторением.',
                  style: TextStyle(
                    color: Color(0xFFBDBDBD),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildNotificationSetting(
    String title, bool value, ValueChanged<bool> onChanged) {
  return SwitchListTile(
    secondary: const Icon(Icons.calendar_month, color: Color(0xFFDD6F31)),
    title: Text(title),
    value: value,
    onChanged: onChanged,
    activeColor: Colors.orange,
  );
}

Widget _buildTimeSetting(String title, String time) {
  return ListTile(
    leading: const Icon(Icons.access_time, color: Color(0xFFDD6F31)),
    title: Text(title),
    trailing: Text(time),
  );
}
