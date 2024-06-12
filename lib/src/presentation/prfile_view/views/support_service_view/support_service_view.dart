import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/presentation/prfile_view/widget/custom_clipped_app_bar.dart';

class SupportServiceView extends StatefulWidget {
  const SupportServiceView({super.key});

  @override
  _SupportServiceViewState createState() => _SupportServiceViewState();
}

class _SupportServiceViewState extends State<SupportServiceView> {
  final _formKey = GlobalKey<FormState>();
  String problem = '';
  String detailedProblem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomClippedAppBar(
            text: '      Служба поддержки',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const Text(
                      'Отправьте нам информацию о проблеме, с которой вы столкнулись. Наши специалисты обработают запрос и свяжутся с вами для решения.',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Проблема',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите проблему';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          problem = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Опишите подробнее проблему',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите описание проблемы';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          detailedProblem = value;
                        });
                      },
                    ),
                    const SizedBox(height: 210),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Запрос отправлен')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDD6F31),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Отправить',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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
