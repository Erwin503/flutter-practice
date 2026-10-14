import 'package:flutter/material.dart';
import 'package:sun_stickers/data/_data.dart';
import 'package:sun_stickers/ui_kit/_ui_kit.dart';

class StickerListView extends StatelessWidget {
  const StickerListView({super.key, required this.stickers});

  final List<Sticker> stickers;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: stickers.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (_, index) {
          final sticker = stickers[index];
          return Container(
            width: 160,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? AppColor.dark : AppColor.light,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(sticker.image, height: 100),
                Text(
                  '\$${sticker.price.toStringAsFixed(0)}',
                  style: AppTextStyle.h3.copyWith(color: AppColor.accent),
                ),
                Text(sticker.name, style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
          );
        },
      ),
    );
  }
}
