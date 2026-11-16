import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sun_stickers/states/sticker_state.dart';
import 'package:sun_stickers/ui/screens/logic_home_screen.dart';
import 'package:sun_stickers/ui_kit/_ui_kit.dart';

void main() {
  final state = StickerState();
  runApp(StoreProvider<int>(store: state.store, child: SunStickersApp(state: state)));
}

class SunStickersApp extends StatelessWidget {
  const SunStickersApp({super.key, required this.state});

  final StickerState state;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<int, int>(
      converter: (store) => store.state,
      builder: (_, __) => MaterialApp(
        title: 'Sun Stickers',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: state.light ? ThemeMode.light : ThemeMode.dark,
        home: LogicHomeScreen(state: state, onThemeChanged: () {}),
      ),
    );
  }
}
