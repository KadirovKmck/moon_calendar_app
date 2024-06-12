import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/core/ui/widgets/container_ui.dart';
import 'package:moon_calendar_app/src/presentation/auth/login_view/login_view.dart';
import 'package:moon_calendar_app/src/presentation/auth/widget/Regester_google_telega.dart';
import 'package:moon_calendar_app/src/core/navigation/navbar_view.dart';

class SingUpView extends StatefulWidget {
  const SingUpView({super.key});

  @override
  _SingUpViewState createState() => _SingUpViewState();
}

class _SingUpViewState extends State<SingUpView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(right: width * 0.2, top: height * 0.02),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: ' Зарегистрироваться\n ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.07,
                        color: const Color(0xFF595D62),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'У вас уже есть аккаунт?   ',
                          style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w400,
                            textBaseline: TextBaseline.alphabetic,
                          ),
                        ),
                        TextSpan(
                          text: 'Войти',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 248, 118, 43),
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Имя',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Почта',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Дата',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Пароль',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Имя',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Почта',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NavbarView()));
                      },
                      child: const ContainerUi(
                        text: 'Войти',
                      )),
                  SizedBox(height: height * 0.03),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                        child: const Text('Или'),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  RegisterWithGoogle(
                    svgPicture: 'assets/icons/google.svg',
                    text: '        Продолжить с Google',
                    onPressed: () {},
                    width: width * 0.8,
                  ),
                  SizedBox(height: height * 0.02),
                  RegisterWithGoogle(
                    svgPicture: 'assets/icons/telega.svg',
                    text: '        Продолжить с Telegram',
                    onPressed: () {},
                    width: width * 0.8,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
