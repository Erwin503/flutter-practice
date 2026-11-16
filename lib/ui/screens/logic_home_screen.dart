import 'package:flutter/material.dart';
import 'package:sun_stickers/data/_data.dart';
import 'package:sun_stickers/states/sticker_state.dart';
import 'package:sun_stickers/ui_kit/_ui_kit.dart';

class LogicHomeScreen extends StatefulWidget {
  const LogicHomeScreen({super.key, required this.state, required this.onThemeChanged});

  final StickerState state;
  final VoidCallback onThemeChanged;

  @override
  State<LogicHomeScreen> createState() => _LogicHomeScreenState();
}

class _LogicHomeScreenState extends State<LogicHomeScreen> {
  int _tab = 0;

  StickerState get state => widget.state;

  void refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(['Stickers', 'Cart', 'Favorites'][_tab]),
        actions: [
          IconButton(
            onPressed: () {
              state.toggleTheme();
              widget.onThemeChanged();
            },
            icon: Icon(state.light ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
          ),
        ],
      ),
      body: IndexedStack(index: _tab, children: [_catalog(), _cart(), _favorites()]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (value) => setState(() => _tab = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.storefront_outlined), selectedIcon: Icon(Icons.storefront), label: 'Catalog'),
          NavigationDestination(icon: Icon(Icons.shopping_cart_outlined), selectedIcon: Icon(Icons.shopping_cart), label: 'Cart'),
          NavigationDestination(icon: Icon(AppIcon.outlinedHeart), selectedIcon: Icon(AppIcon.heart), label: 'Favorites'),
        ],
      ),
    );
  }

  Widget _catalog() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('Morning, Sunny', style: Theme.of(context).textTheme.headlineSmall),
        Text('What sticker do you want\nto buy today', style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(height: 16),
        SizedBox(
          height: 42,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (_, index) {
              final category = state.categories[index];
              return ChoiceChip(
                label: Text(category.type.name),
                selected: category.isSelected,
                selectedColor: AppColor.accent,
                onSelected: (_) {
                  state.onCategoryTap(category);
                  refresh();
                },
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        ...state.stickersByCategory.map(_stickerCard),
      ],
    );
  }

  Widget _stickerCard(Sticker sticker) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Image.asset(sticker.image, width: 52),
        title: Text(sticker.name),
        subtitle: Text('\$${state.stickerPrice(sticker)}'),
        trailing: Icon(sticker.isFavorite ? AppIcon.heart : AppIcon.outlinedHeart, color: AppColor.accent),
        onTap: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => StickerLogicDetail(state: state, sticker: sticker),
          ));
          refresh();
        },
      ),
    );
  }

  Widget _cart() {
    if (state.cart.isEmpty) return _empty(AppAsset.emptyCart, 'Your cart is empty');
    return Column(
      children: [
        Expanded(child: ListView(padding: const EdgeInsets.all(16), children: state.cart.map(_cartItem).toList())),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(children: [Text('Subtotal: \$${state.subtotal.toStringAsFixed(0)}'), const Spacer(), ElevatedButton(onPressed: () { state.onCheckOutTap(); refresh(); }, child: const Text('Checkout'))]),
        ),
      ],
    );
  }

  Widget _cartItem(Sticker sticker) => ListTile(
        leading: Image.asset(sticker.image, width: 44),
        title: Text(sticker.name),
        subtitle: Text('\$${state.stickerPrice(sticker)}'),
        trailing: Wrap(spacing: 0, children: [
          IconButton(onPressed: () { state.onDecreaseQuantityTap(sticker); refresh(); }, icon: const Icon(Icons.remove)),
          Text('${sticker.quantity}'),
          IconButton(onPressed: () { state.onIncreaseQuantityTap(sticker); refresh(); }, icon: const Icon(Icons.add)),
          IconButton(onPressed: () { state.onRemoveFromCartTap(sticker); refresh(); }, icon: const Icon(Icons.delete_outline)),
        ]),
      );

  Widget _favorites() {
    state.favorite = state.stickers.where((item) => item.isFavorite).toList();
    if (state.favorite.isEmpty) return _empty(AppAsset.emptyFavorite, 'No favorite stickers yet');
    return ListView(padding: const EdgeInsets.all(16), children: state.favorite.map((sticker) => ListTile(
      leading: Image.asset(sticker.image, width: 44), title: Text(sticker.name),
      trailing: IconButton(onPressed: () { state.onAddRemoveFavoriteTap(sticker); refresh(); }, icon: const Icon(AppIcon.heart, color: AppColor.accent)),
    )).toList());
  }

  Widget _empty(String asset, String text) => Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Image.asset(asset, height: 140), const SizedBox(height: 12), Text(text)]));
}

class StickerLogicDetail extends StatefulWidget {
  const StickerLogicDetail({super.key, required this.state, required this.sticker});
  final StickerState state;
  final Sticker sticker;
  @override
  State<StickerLogicDetail> createState() => _StickerLogicDetailState();
}

class _StickerLogicDetailState extends State<StickerLogicDetail> {
  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final sticker = widget.sticker;
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: () => setState(() => state.onAddRemoveFavoriteTap(sticker)), icon: Icon(sticker.isFavorite ? AppIcon.heart : AppIcon.outlinedHeart))]),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: Center(child: Image.asset(sticker.image, height: 230))),
          Text(sticker.name, style: Theme.of(context).textTheme.displayLarge),
          Text('\$${state.stickerPrice(sticker)}', style: AppTextStyle.h2.copyWith(color: AppColor.accent)),
          const SizedBox(height: 12), Text(sticker.description), const Spacer(),
          Row(children: [
            IconButton(onPressed: () => setState(() => state.onDecreaseQuantityTap(sticker)), icon: const Icon(Icons.remove_circle_outline)),
            Text('${sticker.quantity}'),
            IconButton(onPressed: () => setState(() => state.onIncreaseQuantityTap(sticker)), icon: const Icon(Icons.add_circle_outline)),
            const Spacer(), ElevatedButton(onPressed: () { state.onAddToCartTap(sticker); Navigator.pop(context); }, child: const Text('Add to cart')),
          ]),
        ]),
      ),
    );
  }
}
