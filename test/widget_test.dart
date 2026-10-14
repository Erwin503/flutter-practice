import 'package:flutter_test/flutter_test.dart';
import 'package:sun_stickers/main.dart';

void main() {
  testWidgets('shows the sticker list screen', (tester) async {
    await tester.pumpWidget(const SunStickersApp());
    expect(find.text('Morning, Sunny'), findsOneWidget);
  });
}
