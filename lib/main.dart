import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ProjetoRedesApp());
}

class ProjetoRedesApp extends StatelessWidget {
  const ProjetoRedesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hub Redes',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F6FC),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3458DB)),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}
