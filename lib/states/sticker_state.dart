import 'package:sun_stickers/data/_data.dart';

/// Бизнес-логика варианта без библиотек. Обновление интерфейса вызывает
/// StatefulWidget через setState после каждого действия.
class StickerState {
  StickerState()
      : categories = AppData.categories,
        stickers = AppData.stickers,
        stickersByCategory = AppData.stickers;

  final List<StickerCategory> categories;
  final List<Sticker> stickers;
  List<Sticker> stickersByCategory;
  List<Sticker> cart = <Sticker>[];
  List<Sticker> favorite = <Sticker>[];
  bool light = true;

  void onCategoryTap(StickerCategory category) {
    for (final item in categories) {
      item.isSelected = item.type == category.type;
    }
    stickersByCategory = category.type == StickerType.all
        ? List<Sticker>.from(stickers)
        : stickers.where((item) => item.type == category.type).toList();
  }

  void onIncreaseQuantityTap(Sticker sticker) => sticker.quantity++;

  void onDecreaseQuantityTap(Sticker sticker) {
    if (sticker.quantity > 1) sticker.quantity--;
  }

  void onAddToCartTap(Sticker sticker) {
    sticker.cart = true;
    _syncCart();
  }

  void onRemoveFromCartTap(Sticker sticker) {
    sticker.cart = false;
    sticker.quantity = 1;
    _syncCart();
  }

  void onCheckOutTap() {
    for (final sticker in cart) {
      sticker.cart = false;
      sticker.quantity = 1;
    }
    _syncCart();
  }

  void onAddRemoveFavoriteTap(Sticker sticker) {
    sticker.isFavorite = !sticker.isFavorite;
    favorite = stickers.where((item) => item.isFavorite).toList();
  }

  void toggleTheme() => light = !light;

  String stickerPrice(Sticker sticker) => (sticker.quantity * sticker.price).toStringAsFixed(0);

  double get subtotal => cart.fold(0, (sum, sticker) => sum + sticker.price * sticker.quantity);

  void _syncCart() => cart = stickers.where((item) => item.cart).toList();
}
