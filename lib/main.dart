import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Texto',
      home: Home(),
    );
  }
}
