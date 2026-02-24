import 'package:flutter_test/flutter_test.dart';
import 'package:playground_adk/main.dart';

void main() {
  testWidgets('PlaygroundApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const PlaygroundApp());
    expect(find.byType(PlaygroundApp), findsOneWidget);
  });
}
