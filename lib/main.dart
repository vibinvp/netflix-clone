import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants/colors/colors.dart';
import 'package:netflix_clone/screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: backgroundBlack,
        scaffoldBackgroundColor: backgroundBlack,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        cardColor: backgroundBlack,
        splashColor: Colors.transparent,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: backgroundWhite),
          bodyText2: TextStyle(color: backgroundWhite),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      title: 'Netflix Clone',
    );
  }
}
