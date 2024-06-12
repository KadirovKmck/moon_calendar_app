import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/core/ui/widgets/container_ui.dart';
import 'package:moon_calendar_app/src/presentation/prfile_view/views/notification_view/affirmations.dart';
import 'package:moon_calendar_app/src/presentation/prfile_view/widget/custom_clipped_app_bar.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  bool oneDayBefore = true;
  bool onEventDay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomClippedAppBar(
            text: '          Уведомления',
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0x0CDD6F31),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.favorite,
                      color: Color(0xFFDD6F31),
                    ),
                    title: const Text('Аффирмации'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AffirmationsView(),
                          ));
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Лунный календарь',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0x0CDD6F31),
                      ),
                      child: Column(
                        children: [
                          _buildLunarEventTile('Экадаши'),
                          _buildLunarEventTile('Полнолуние'),
                          _buildLunarEventTile('Новолуние'),
                          _buildLunarEventTile('Затмение'),
                        ],
                      ),
                    ),
                  ),
                ],
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
                      _buildNotificationSetting('За один день', oneDayBefore,
                          (bool value) {
                        setState(() {
                          oneDayBefore = value;
                        });
                      }),
                      _buildTimeSetting('Время уведомления', '19:00'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0x0CDD6F31),
                  ),
                  child: Column(
                    children: [
                      _buildNotificationSetting('В день события', onEventDay,
                          (bool value) {
                        setState(() {
                          onEventDay = value;
                        });
                      }),
                      _buildTimeSetting('Время уведомления', '19:00'),
                    ],
                  ),
                ),
              ),
              const ContainerUi(text: 'Сохранить изменения')
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLunarEventTile(String title) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.check, color: Color(0xFFDD6F31)),
    );
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
}
