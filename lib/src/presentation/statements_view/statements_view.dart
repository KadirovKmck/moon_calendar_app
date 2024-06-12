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
              final double screenHeight = MediaQuery.of(context).size.height;
              final double screenWidth = MediaQuery.of(context).size.width;
              return SizedBox(
                height: screenHeight * 0.55,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Column(
                    children: [
                      Image(
                        image: const AssetImage('assets/images/woman.png'),
                        height: screenHeight * 0.2,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Аффирмации\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF595D62),
                            fontSize: screenHeight * 0.035,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Особые фразы, которые исцеляют сознание.\n'
                                  'Повторяйте их каждый день - и наблюдайте\n'
                                  'позитивные перемены в жизни.',
                              style: TextStyle(
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFBDBDBD),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xFFDD6F31),
                        ),
                        height: screenHeight * 0.07,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Хорошо',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.02,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Настроить уведомления',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFBDBDBD),
                            fontSize: screenHeight * 0.02,
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
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/nature.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: isPortrait ? screenWidth * 0.1 : screenWidth * 0.05,
                top: screenHeight * 0.1,
              ),
              child: RichText(
                text: TextSpan(
                  text: '                Аффирмация на сегодня\n',
                  style: TextStyle(
                    fontSize: screenHeight * 0.02,
                    color: const Color(0xFF595D62),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Я радуюсь каждому\n        новому дню!',
                      style: TextStyle(
                        fontSize: screenHeight * 0.04,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
