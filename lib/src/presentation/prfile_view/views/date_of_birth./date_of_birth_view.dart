import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/core/ui/widgets/container_ui.dart';
import 'package:moon_calendar_app/src/presentation/prfile_view/widget/custom_clipped_app_bar.dart';

class BirthDateScreen extends StatelessWidget {
  const BirthDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomClippedAppBar(
            text: '         Дата рождения',
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0x0CDD6F31),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.cake, color: Colors.orange),
                    title: const Text(
                      'Дата рождения',
                    ),
                    trailing: const Text('21.07.1993'),
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(
                height: 490,
              ),
              const ContainerUi(
                text: 'Сохранить изменения',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
