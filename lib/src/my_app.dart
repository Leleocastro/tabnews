import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabnews/src/routes/app_pages.dart';
import 'package:tabnews/src/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TabNews',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
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
      initialRoute: Routes.home,
      getPages: AppPages.routes,
    );
  }
}
