import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      iconSize: const MaterialStatePropertyAll<double>(22),
      backgroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
      foregroundColor: const MaterialStatePropertyAll<Color>(Colors.black),
      padding: const MaterialStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(vertical: 11, horizontal: 10),
      ),
      shape: MaterialStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white, size: 28),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  ),
);
