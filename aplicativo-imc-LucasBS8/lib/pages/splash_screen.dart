import 'dart:async';
import 'package:appimc/pages/homePage.dart';
import 'package:flutter/material.dart';

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
          builder: (_) => const MyHomePage(
                title: 'Cálculo de IMC',
              )));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData ctxPage = MediaQuery.of(context);
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Calculo de IMC', textScaler: TextScaler.linear(4),style: TextStyle(fontWeight: FontWeight.bold)),
          const Padding(padding: EdgeInsets.all(10)),
          Image.asset(
            'assets/images/mainSplash.png',
            fit: BoxFit.fill,
            width: ctxPage.size.width * 0.4,
            height: ctxPage.size.width * 0.4,
          ),
        ],
      )),
    );
  }
}
