import 'package:flutter/material.dart';

class StatementsView extends StatefulWidget {
  const StatementsView({super.key});

  @override
  _StatementsViewState createState() => _StatementsViewState();
}

class _StatementsViewState extends State<StatementsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Image(image: AssetImage('assets/images/woman.png')),
                      RichText(
                        text: const TextSpan(
                          text: '              Аффирмации\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF595D62),
                            fontSize: 28,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  '      Особые фразы, которые исцеляют сознание.\n       Повторяйте их каждый день - и наблюдайте\n                  позитивные перемены в жизни.',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFBDBDBD),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xFFDD6F31),
                        ),
                        height: 50,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Хорошо',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Настроить уведомления',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFBDBDBD),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/foto.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 60, top: 100),
              child: RichText(
                text: const TextSpan(
                  text: '              Аффирмация на сегодня\n',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF595D62),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Я радуюсь каждому\n       новому дню!',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
