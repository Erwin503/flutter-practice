import 'package:flutter/material.dart';
import 'package:sun_stickers/data/_data.dart';
import 'package:sun_stickers/ui/widgets/sticker_list_view.dart';
import 'package:sun_stickers/ui_kit/_ui_kit.dart';

class StickerListScreen extends StatefulWidget {
  const StickerListScreen({super.key});

  @override
  State<StickerListScreen> createState() => _StickerListScreenState();
}

class _StickerListScreenState extends State<StickerListScreen> {
  final categories = AppData.categories;

  List<Sticker> get stickers {
    final selected = categories.firstWhere((category) => category.isSelected);
    if (selected.type == StickerType.all) return AppData.stickers;
    return AppData.stickers.where((sticker) => sticker.type == selected.type).toList();
  }

  void selectCategory(int index) {
    setState(() {
      for (var i = 0; i < categories.length; i++) {
        categories[i].isSelected = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on_outlined, color: AppColor.accent),
            SizedBox(width: 4),
            Text('Location'),
          ],
        ),
        actions: const [Padding(padding: EdgeInsets.only(right: 16), child: Icon(Icons.notifications_none))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Morning, Sunny', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text('What sticker do you want\nto buy today', style: Theme.of(context).textTheme.displayLarge),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search sticker',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Text('Available for you', style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: 8),
          SizedBox(
            height: 42,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, index) {
                final category = categories[index];
                return ChoiceChip(
                  label: Text(category.type.name),
                  selected: category.isSelected,
                  selectedColor: AppColor.accent,
                  onSelected: (_) => selectCategory(index),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          StickerListView(stickers: stickers),
          Text('Best stickers of the week', style: Theme.of(context).textTheme.displaySmall),
          StickerListView(stickers: AppData.stickers.reversed.toList()),
        ],
      ),
    );
  }
}
