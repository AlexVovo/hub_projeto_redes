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
      title: 'Projeto Redes',
      theme: ThemeData(primarySwatch: Colors.blueGrey, fontFamily: 'Roboto'),
      home: HomeScreen(),
    );
  }
}
