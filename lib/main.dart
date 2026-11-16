import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sun_stickers/states/sticker_state.dart';
import 'package:sun_stickers/states/riverpod_sticker_controller.dart';
import 'package:sun_stickers/ui/screens/logic_home_screen.dart';
import 'package:sun_stickers/ui_kit/_ui_kit.dart';

void main() => runApp(const ProviderScope(child: SunStickersApp()));

class SunStickersApp extends ConsumerWidget {
  const SunStickersApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(stickerProvider);
    final state = ref.read(stickerProvider.notifier).logic;
    return MaterialApp(
      title: 'Sun Stickers',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: state.light ? ThemeMode.light : ThemeMode.dark,
      home: LogicHomeScreen(state: state, onThemeChanged: () {}),
    );
  }
}
