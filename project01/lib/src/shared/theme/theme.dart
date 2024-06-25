import 'package:flutter/material.dart';

part 'color_schemes.g.dart';

final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.onInverseSurface,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _lightColorScheme.onInverseSurface),
    bottomAppBarTheme: BottomAppBarTheme(color: _lightColorScheme.surface));

final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _darkColorScheme,
    appBarTheme: AppBarTheme(
      color: _darkColorScheme.onInverseSurface,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _darkColorScheme.onInverseSurface),
);