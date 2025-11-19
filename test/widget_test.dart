// test/widget_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_app/main.dart'; // ← Đảm bảo tên package đúng (thường là tên project)

void main() {
  testWidgets('Calculator works correctly', (WidgetTester tester) async {
    // ← DÙNG ĐÚNG TÊN: CalculatorApp
    await tester.pumpWidget(const CalculatorApp());

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.text('8'));
    await tester.pump();
    await tester.tap(find.text('×'));
    await tester.pump();
    await tester.tap(find.text('9'));
    await tester.pump();
    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.text('72'), findsOneWidget);
  });
}