// import 'package:dfgh/home.dart';
import 'package:dfgh/login.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',

      home: LoginScreen(),
    );
  }
}
