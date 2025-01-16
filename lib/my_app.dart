import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizgameofthrones/pages/start_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Quiz App",
        theme: ThemeData(
          textTheme: GoogleFonts.openSansCondensedTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const StartScreen(),
      ),
    );
  }
}
