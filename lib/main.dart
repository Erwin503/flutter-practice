import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sun_stickers/states/sticker_state.dart';
import 'package:sun_stickers/ui/screens/logic_home_screen.dart';
import 'package:sun_stickers/ui_kit/_ui_kit.dart';

void main() {
  Get.put(StickerState());
  runApp(const SunStickersApp());
}

class SunStickersApp extends StatefulWidget {
  const SunStickersApp({super.key});

  @override
  State<SunStickersApp> createState() => _SunStickersAppState();
}

class _SunStickersAppState extends State<SunStickersApp> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StickerState>(
      builder: (state) => GetMaterialApp(
        title: 'Sun Stickers',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: state.light ? ThemeMode.light : ThemeMode.dark,
        home: LogicHomeScreen(state: state, onThemeChanged: state.update),
      ),
    );
  }
}
