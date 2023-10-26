// import 'dart:ffi';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Flutter Pertamaku",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("belajar Fluter"),
        ),
        body: Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}
