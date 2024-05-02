import 'dart:developer';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../apis/apis.dart';
import '../main.dart';
import '../ui/home_screen.dart';
import 'login_screen.dart';

//splash screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 7), () {
      //exit full-screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      if (APIs.auth.currentUser != null) {
        log('\nUser: ${APIs.auth.currentUser}');
        //navigate to home screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        //navigate to login screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
     backgroundColor: Colors.black,
      body: Stack(children: [
        Positioned(
            top: mq.height * .15,
            right: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset('assets/images/main.png',fit: BoxFit.contain,)),

        Positioned(
            bottom: mq.height * .15,
            width: mq.width,
            left: mq.width * .2,
            child: AnimatedTextKit(animatedTexts: [
              TypewriterAnimatedText("Develop By HIMPREET SINGH...", textStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xFFFFD700),
              ),
                speed: const Duration(milliseconds: 200),
              ),

            ],
              totalRepeatCount: 4,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            )),
      ]),
    );
  }
}
