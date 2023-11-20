import 'package:flutter/material.dart';
import 'package:flutter_tutorial/design_pattern/mvc_pattern/source/use_momentum/controller/counter_controller.dart';
import 'package:momentum/momentum.dart';

import 'view/home_view.dart';

void main() {
  runApp(Momentum(
    controllers: [CounterController()],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Momentum',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}
