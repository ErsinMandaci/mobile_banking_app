import 'package:banking_mobile_app/core/constants/color_constant.dart';
import 'package:flutter/material.dart';

final class AppThemeDark {
  const AppThemeDark._();

  static ThemeData getTheme() => ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: DarkColorConstants.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: DarkColorConstants.elevatedButtonColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
        ),
        iconTheme: const IconThemeData(
          size: 25,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: DarkColorConstants.outlinedButtonColor,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              color: Colors.white,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: Colors.grey,
          suffixIconColor: Colors.grey,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: DarkColorConstants.formFieldColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: DarkColorConstants.outlinedButtonColor,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        cardTheme: CardTheme(
          color: DarkColorConstants.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
}
