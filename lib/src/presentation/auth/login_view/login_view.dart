import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/presentation/auth/sing_up_view/sing_up_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    bool obscureText = true;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Image(
              image: AssetImage('assets/images/q.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 56, top: 15),
              child: RichText(
                text: const TextSpan(
                  text: ' Авторизация\n ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0xFF595D62),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'У вас еще нет аккаунта?   ',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          textBaseline: TextBaseline.alphabetic),
                    ),
                    TextSpan(
                      text: 'Зарегистрироваться',
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
              padding: const EdgeInsets.all(17.0),
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
                  TextField(
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      hintText: 'Пароль',
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      suffixIcon: TextButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: const Text('Показат',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Забыли пароль?',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                            color: Color.fromARGB(255, 131, 131, 131)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SingUpView()));
                    },
                    child: Container(
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
                        Image(image: AssetImage('assets/images/w.png')),
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
                        Image(image: AssetImage('assets/images/a.png')),
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
            ),
          ],
        ),
      ),
    );
  }
}
