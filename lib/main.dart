import 'package:flutter/material.dart';
import 'package:moon_calendar_app/src/presentation/welcom_view/splash_view/splash_view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
