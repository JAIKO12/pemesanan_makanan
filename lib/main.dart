import 'package:aplikasi_pemesanan_makanan/atuhentication/authentication.dart';
import 'package:aplikasi_pemesanan_makanan/firebase_options.dart';
import 'package:aplikasi_pemesanan_makanan/login_page/welcome_page.dart';
import 'package:aplikasi_pemesanan_makanan/login_page/theme_shared.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
