import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 77, 243, 44),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 9, 65, 6),
);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          foregroundColor: kColorScheme.primaryContainer,
          backgroundColor: kColorScheme.onTertiaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 15,
          ),
          elevation: 5,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: kColorScheme.onPrimaryContainer,
            backgroundColor: kColorScheme.primaryContainer,
            elevation: 2,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
             titleLarge: TextStyle(
                color: kColorScheme.onPrimaryContainer,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
              titleSmall: TextStyle(
                color: kColorScheme.onSecondaryContainer,
                fontSize: 14,
              ),
        ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 15,
          ),
          elevation: 5,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
            backgroundColor: kDarkColorScheme.primaryContainer,
            elevation: 2,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                color: kDarkColorScheme.onPrimaryContainer,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
              titleSmall: TextStyle(
                color: kDarkColorScheme.onSecondaryContainer,
                fontSize: 14,
              )
        ),
);