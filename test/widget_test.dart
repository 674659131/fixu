import 'package:flutter_test/flutter_test.dart';
import 'package:fixu/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FixUApp());
    expect(find.text('FixU'), findsOneWidget);
  });
}
