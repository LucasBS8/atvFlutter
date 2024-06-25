import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqfliatividade/page/splash_screen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
part 'src/theme/material_scheme.dart';

void main() {
  if (kIsWeb) {
    // Não faz nada de especial para web
  } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Inicializa o sqflite_common_ffi para desktop
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          const MaterialTheme(Typography.blackCupertino).lightMediumContrast(),
      darkTheme:
          const MaterialTheme(Typography.blackCupertino).darkMediumContrast(),
      highContrastTheme:
          const MaterialTheme(Typography.blackCupertino).lightHighContrast(),
      highContrastDarkTheme:
          const MaterialTheme(Typography.blackCupertino).darkHighContrast(),
      home: const SplashScreen(),
    );
  }
}
