import 'package:flutter/material.dart';
import 'learn.dart';

void main() {
  runApp(const MyApp(title: "Calculator"));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(primaryColor: Colors.blueGrey),
      home: const Learn(),
      debugShowCheckedModeBanner: false,
    );
  }
}
