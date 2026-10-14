import 'package:flutter/material.dart';
import 'package:sun_stickers/ui/screens/sticker_list_screen.dart';
import 'package:sun_stickers/ui_kit/_ui_kit.dart';

void main() => runApp(const SunStickersApp());

class SunStickersApp extends StatelessWidget {
  const SunStickersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sun Stickers',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const StickerListScreen(),
    );
  }
}
