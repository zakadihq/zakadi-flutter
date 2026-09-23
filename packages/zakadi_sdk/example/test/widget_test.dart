import 'package:flutter_test/flutter_test.dart';

import 'package:zakadi_sdk_example/main.dart';

void main() {
  testWidgets('the example app starts', (WidgetTester tester) async {
    await tester.pumpWidget(const ExampleApp());

    expect(find.text('zakadi_sdk example'), findsOneWidget);
  });
}
