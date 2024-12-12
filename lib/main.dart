import 'package:flutter/material.dart';
import 'package:fourth_app/imagescroll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.f
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car App',
      home:Imagescroll(),
    );
  }
}