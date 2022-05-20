import 'package:flutter/material.dart';

import 'src/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TabNews',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color(0xFF24292f),
          secondary: Colors.blue,
          surface: Colors.black,
          background: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Color(0xFF24292f),
          onSurface: Color(0xFF24292f),
          onBackground: Colors.white,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      home: const HomePage(),
    );
  }
}
