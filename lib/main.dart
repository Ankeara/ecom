import 'package:ecom/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        scaffoldBackgroundColor: kBackgroundColor,
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

const Color kPrimaryColor = Colors.blue;
const Color kBackgroundColor = Colors.white;
const Color kBlack = Colors.black45;
