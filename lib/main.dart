import 'package:flutter/material.dart';

void main() => runApp(const SunStickersApp());

class SunStickersApp extends StatelessWidget {
  const SunStickersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sun Stickers',
      theme: ThemeData(colorSchemeSeed: Colors.orange),
      home: const Scaffold(
        body: Center(child: Text('Sun Stickers')),
      ),
    );
  }
}
