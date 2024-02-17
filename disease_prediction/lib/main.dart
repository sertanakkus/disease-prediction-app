import 'package:disease_prediction/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<String> dataList = List.generate(132, (index) => 'Eleman $index');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Disease Prediction',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.dark(primary: (Colors.red[900])!),
        ),
        home: const HomeScreen());
  }
}
