import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sun_stickers/states/sticker_state.dart';
import 'package:sun_stickers/ui/screens/logic_home_screen.dart';
import 'package:sun_stickers/ui_kit/_ui_kit.dart';

void main() => runApp(
      BlocProvider(
        create: (_) => StickerState(),
        child: const SunStickersApp(),
      ),
    );

class SunStickersApp extends StatelessWidget {
  const SunStickersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StickerState, int>(
      builder: (context, _) {
        final state = context.read<StickerState>();
        return MaterialApp(
          title: 'Sun Stickers',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.light ? ThemeMode.light : ThemeMode.dark,
          home: LogicHomeScreen(state: state, onThemeChanged: () {}),
        );
      },
    );
  }
}
