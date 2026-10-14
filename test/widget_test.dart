import 'package:flutter_test/flutter_test.dart';
import 'package:sun_stickers/main.dart';

void main() {
  testWidgets('shows the application title', (tester) async {
    await tester.pumpWidget(const SunStickersApp());
    expect(find.text('Sun Stickers'), findsOneWidget);
  });
}
