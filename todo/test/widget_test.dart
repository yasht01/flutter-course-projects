import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:todo/main.dart';

void main() {
  testWidgets('Task screen test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Todoey'), findsOneWidget);
  });
}
