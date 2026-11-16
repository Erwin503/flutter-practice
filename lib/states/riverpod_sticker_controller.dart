import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sun_stickers/states/sticker_state.dart';

final stickerProvider = NotifierProvider<StickerController, int>(StickerController.new);

class StickerController extends Notifier<int> {
  late final StickerState logic;

  @override
  int build() {
    logic = StickerState(onChanged: () => state++);
    return 0;
  }
}
