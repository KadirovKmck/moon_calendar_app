import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/core/navigation/navbar_view.dart';
import 'package:moon_calendar_app/src/core/ui/widgets/container_ui.dart';
import 'package:moon_calendar_app/src/presentation/auth/sing_up_view/sing_up_view.dart';
import 'package:moon_calendar_app/src/presentation/auth/widget/Regester_google_telega.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Image(
                image: const AssetImage('assets/images/fire.png'),
                width: width * 0.3,
                height: width * 0.3,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: width * 0.25,
                  top: height * 0.03,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SingUpView(),
                        ));
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Aвторизация\n ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.06,
                        color: const Color(0xFF595D62),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'У вас еще нет аккаунта?   ',
                          style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w400,
                              textBaseline: TextBaseline.alphabetic),
                        ),
                        TextSpan(
                          text: 'Зарегистрироваться',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: const Color.fromARGB(255, 248, 118, 43),
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.04),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Имя',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(width * 0.02),
                                topRight: Radius.circular(width * 0.02))),
                      ),
                    ),
                    TextField(
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        hintText: 'Пароль',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(width * 0.02),
                                bottomRight: Radius.circular(width * 0.02))),
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
                    SizedBox(height: height * 0.02),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Забыли пароль?',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: width * 0.03,
                              color: const Color.fromARGB(255, 131, 131, 131)),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.02),
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
              ),
            ],
          );
        },
      ),
    );
  }
}
