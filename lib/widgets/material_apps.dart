
import 'package:flutter/material.dart';

import '../screen/home/home_layout.dart';

class MaterialApps extends StatelessWidget {
  const MaterialApps({super.key});

  @override
  Widget build(BuildContext context) {
    bool ismobileSize = MediaQuery.of(context).size.width<700;
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: ColorScheme.dark(
          background: const Color(0xFF121212),
          secondary: const Color(0xFF1DB954),
        ),

        // backgroundColor: const Color(0xFF121212),
        primaryColor: Colors.black,

        // accentColor: const Color(0xFF1DB954),
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headlineLarge:  TextStyle(
            color: Colors.white,
            fontSize : ismobileSize? 22: 32,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            fontSize: 12.0,
            color: Colors.grey[300],
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
          ),
          bodyLarge: TextStyle(
            color: Colors.grey[300],
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
          bodySmall: TextStyle(color: Colors.grey[300], letterSpacing: 1.0),
        ),
      ),
      home: HomeLayout(),
    );
  }
}
