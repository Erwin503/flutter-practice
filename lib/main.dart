import 'package:flutter/material.dart';
import 'package:sun_stickers/ui_kit/_ui_kit.dart';

void main() => runApp(const SunStickersApp());

class SunStickersApp extends StatelessWidget {
  const SunStickersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sun Stickers',
      theme: ThemeData(colorSchemeSeed: AppColor.accent),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Sun Stickers'),
              Image.asset(AppAsset.profileImage),
              const Icon(AppIcon.heart),
            ],
          ),
        ),
      ),
    );
  }
}
