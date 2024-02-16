import 'package:flutter/material.dart';
import 'package:moodtracker/db/db.dart';
import 'package:moodtracker/pages/home.dart';
import 'package:google_fonts/google_fonts.dart';

late ObjectBox objectbox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();
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
              cardColor: Color.fromARGB(255, 21, 21, 22),
              textTheme: GoogleFonts.quicksandTextTheme(),
              colorScheme: const ColorScheme(
                brightness: Brightness.light,
                primary: Color.fromRGBO(75, 0, 130, 1.0), // Indigo
                onPrimary: Colors.white,
                secondary: Color.fromRGBO(211, 147, 58, 1), // Pink
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
