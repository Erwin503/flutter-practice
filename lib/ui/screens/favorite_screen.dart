import 'package:flutter/material.dart';
import 'package:sun_stickers/data/_data.dart';
import 'package:sun_stickers/ui_kit/_ui_kit.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Sticker> get favorites => AppData.stickers.where((sticker) => sticker.isFavorite).toList();

  @override
  Widget build(BuildContext context) {
    final items = favorites;

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite stickers')),
      body: items.isEmpty ? _emptyState() : _favoriteList(items),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AppAsset.emptyFavorite, height: 160),
          const SizedBox(height: 16),
          Text('No favorite stickers yet', style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
    );
  }

  Widget _favoriteList(List<Sticker> items) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, index) {
        final sticker = items[index];
        return ListTile(
          tileColor: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          leading: Image.asset(sticker.image, width: 48),
          title: Text(sticker.name),
          subtitle: Text('\$${sticker.price.toStringAsFixed(0)}'),
          trailing: IconButton(
            onPressed: () => setState(() => sticker.isFavorite = false),
            icon: const Icon(AppIcon.heart, color: AppColor.accent),
          ),
        );
      },
    );
  }
}
