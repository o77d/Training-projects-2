import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/categories.dart';
import 'package:flutter_application_2/pages/product_details.dart';
import 'package:flutter_application_2/pages/splash.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          
          elevation: 0,
          
        ),
      ),

      home: Splash(),
    );
  }
}
