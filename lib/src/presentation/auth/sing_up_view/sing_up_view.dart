import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/core/ui/widgets/container_ui.dart';
import 'package:moon_calendar_app/src/presentation/auth/widget/Regester_google_telega.dart';
import 'package:moon_calendar_app/src/utils/navbar_view/navbar_view.dart';

class SingUpView extends StatefulWidget {
  const SingUpView({super.key});

  @override
  _SingUpViewState createState() => _SingUpViewState();
}

class _SingUpViewState extends State<SingUpView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 96, top: 20),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                        hintText: 'Пароль',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
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
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavbarView(),
                          ),
                        );
                      },
                      child: const ContainerUi(text: 'Продолжить')),
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
                  RegisterWithGoogle(
                    svgPicture: 'assets/icons/google.svg',
                    text: '            Продолжить с Google',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 10),
                  RegisterWithGoogle(
                    svgPicture: 'assets/icons/telega.svg',
                    text: '            Продолжить с Telegram',
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
