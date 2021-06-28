import 'package:drinks_wiki/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.milongaTextTheme(),
        appBarTheme: AppBarTheme().copyWith(
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.milonga().fontFamily,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
