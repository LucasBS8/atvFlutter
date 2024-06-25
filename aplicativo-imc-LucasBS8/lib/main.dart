import 'package:appimc/pages/splash_screen.dart';
import 'package:flutter/material.dart';
part 'package:appimc/src/themes/color_schemes.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC cálculo',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: _lightColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: _lightColorScheme.primaryContainer,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: _lightColorScheme.primary,
              foregroundColor: _lightColorScheme.onPrimary),
        ),
      ),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: _darkColorScheme,
          appBarTheme: AppBarTheme(
            backgroundColor: _darkColorScheme.primaryContainer,
          ),
                  textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: _lightColorScheme.primary,
              foregroundColor: _lightColorScheme.onPrimary),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
