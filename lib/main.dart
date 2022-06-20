import 'package:flutter/material.dart';
import 'package:guessing_game/constants.dart';
import 'package:guessing_game/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guessing Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryColor,
          background: kBackgroundColor,
        ),
        scaffoldBackgroundColor: kBackgroundColor,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: kPrimaryColorLigth,
          iconColor: kPrimaryColor,
          prefixIconColor: kPrimaryColor,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 6,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
