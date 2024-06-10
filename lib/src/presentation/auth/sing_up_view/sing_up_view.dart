import 'package:flutter/material.dart';

class SingUpView extends StatefulWidget {
  const SingUpView({super.key});

  @override
  _SingUpViewState createState() => _SingUpViewState();
}

class _SingUpViewState extends State<SingUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 96, top: 50),
            child: RichText(
              text: const TextSpan(
                text: ' Зарегистрироваться\n ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xFF595D62),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'У вас уже есть аккаунт?   ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        textBaseline: TextBaseline.alphabetic),
                  ),
                  TextSpan(
                    text: 'Войти',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color.fromARGB(255, 248, 118, 43),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Имя',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Почта',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                      hintText: 'Дата',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                      hintText: 'Пароль',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Имя',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Почта',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFFDD6F31),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: const Center(
                      child: Text(
                    'Войти',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )),
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Или'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  width: 396,
                  height: 56,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xFFE2E2E2)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 15),
                      Image(
                        image: AssetImage('assets/images/w.png'),
                      ),
                      SizedBox(width: 65),
                      Text(
                        'Продолжить с Google',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFDD6F31),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 396,
                  height: 56,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xFFE2E2E2)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 15),
                      Image(
                        image: AssetImage('assets/images/a.png'),
                      ),
                      SizedBox(width: 65),
                      Text(
                        'Продолжить с Telegram',
                        style: TextStyle(
                          color: Color(0xFFDD6F31),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
