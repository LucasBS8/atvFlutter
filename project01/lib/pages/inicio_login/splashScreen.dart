import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project01/pages/inicio_login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => const Login()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fill,
            width: 230,
          ),
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: SizedBox.fromSize(
              size: const Size.square(104),
              child: const CircularProgressIndicator(
                semanticsLabel: 'Circular progress indicator',
              ),
            ),
          )
        ],
      )),
    );
  }
}
