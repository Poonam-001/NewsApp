import 'package:flutter/material.dart';
import 'package:news_app/news_application/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF8EEE2),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffF8EEE2),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SecondPage(),
    );
  }
}
