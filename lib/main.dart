import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';
import 'package:ortalama_hesapla/view/main_page.dart';

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
      title: "GPA",
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.mainColor),
        primarySwatch: AppConstants.mainColor,
        useMaterial3: false,
      ),
      home: const Mainpage(),
    );
  }
}
