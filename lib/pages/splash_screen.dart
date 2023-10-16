import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:meuprimeiroapp/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  openHome() {
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    openHome();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF820AD1),
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(width: 20.0, height: 100.0),
              const Text(
                'Be',
                style: TextStyle(fontSize: 43.0),
              ),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Horizon',
                ),
                child: AnimatedTextKit(
                  repeatForever: false,
                  totalRepeatCount: 1,
                  animatedTexts: [
                    RotateAnimatedText('INCRÍVEL'),
                    RotateAnimatedText('TRANSFORMADOR'),
                    RotateAnimatedText('INOVAÇÃO'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
