import 'package:flutter/material.dart';
import 'package:flutter_tutorial/state_management/bloc/source/lib/features/home/ui/home.dart';

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
        primaryColor: Colors.teal,
      ),
      home: const Home(),
    );
  }
}
