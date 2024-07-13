import 'package:flutter/material.dart';

// class LightTheme extends StatelessWidget {
//   const LightTheme({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

ThemeData LightTheme = ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Color.fromARGB(255, 255, 255, 255),
      secondary: Color(0xFF516FB6),
      surface: Color.fromRGBO(182, 179, 179, 0.253),
      surfaceBright: const Color.fromARGB(255, 0, 0, 0),
      error: Color.fromARGB(255, 247, 66, 66),
    ));
