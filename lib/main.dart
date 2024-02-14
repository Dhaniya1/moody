import 'package:flutter/material.dart';
import 'package:moodtracker/pages/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              canvasColor: const Color.fromRGBO(225, 213, 201, 1.0),
              cardColor: const Color.fromRGBO(34, 35, 37, 1.0),
              textTheme: GoogleFonts.jostTextTheme(),
              colorScheme: const ColorScheme(
                brightness: Brightness.light,
                primary: Color(0xFF5C6BC0), // Indigo
                onPrimary: Colors.white,
                secondary: Color.fromRGBO(195, 147, 82, 1.0), // Pink
                onSecondary: Colors.white,
                error: Color(0xFFE57373), // Red
                onError: Colors.white,
                background: Color(0xFFE0E0E0), // Grey
                onBackground: Colors.black,
                surface: Color(0xFFBDBDBD), // Grey
                onSurface: Colors.black,
              )),
          home: const HomePage()),
    );
  }
}
