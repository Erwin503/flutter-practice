import 'package:flutter/material.dart';
import 'package:sun_stickers/data/_data.dart';
import 'package:sun_stickers/ui_kit/_ui_kit.dart';

class StickerDetailScreen extends StatefulWidget {
  const StickerDetailScreen({super.key, required this.sticker});

  final Sticker sticker;

  @override
  State<StickerDetailScreen> createState() => _StickerDetailScreenState();
}

class _StickerDetailScreenState extends State<StickerDetailScreen> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.sticker.quantity;
  }

  @override
  Widget build(BuildContext context) {
    final sticker = widget.sticker;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        actions: [
          IconButton(
            onPressed: () => setState(() => sticker.isFavorite = !sticker.isFavorite),
            icon: Icon(sticker.isFavorite ? AppIcon.heart : AppIcon.outlinedHeart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Center(child: Image.asset(sticker.image, height: 250))),
            Text(sticker.name, style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 8),
            Text('\$${sticker.price.toStringAsFixed(0)}', style: AppTextStyle.h2.copyWith(color: AppColor.accent)),
            const SizedBox(height: 12),
            Text(sticker.description, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  onPressed: quantity == 1 ? null : () => setState(() => quantity--),
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text('$quantity', style: Theme.of(context).textTheme.headlineMedium),
                IconButton(
                  onPressed: () => setState(() => quantity++),
                  icon: const Icon(Icons.add_circle_outline),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => setState(() {
                    sticker.quantity = quantity;
                    sticker.cart = true;
                  }),
                  child: const Text('Add to cart'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
