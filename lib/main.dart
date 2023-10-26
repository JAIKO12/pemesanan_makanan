import 'package:aplikasi_pemesanan_makanan/login_page/welcome_page.dart';
import 'package:aplikasi_pemesanan_makanan/login_page/theme_shared.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          primaryColor: secondaryColor,
          canvasColor: Colors.transparent),
      home: const WelcomePage(),
    );
  }
}
