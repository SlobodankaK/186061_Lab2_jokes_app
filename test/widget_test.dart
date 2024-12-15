import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab2_186061/main.dart';

void main() {
  testWidgets('Verify Joke Types and Navigation', (WidgetTester tester) async {
    await tester.pumpWidget( MyApp());

    expect(find.text('Joke Types'), findsOneWidget);

    expect(find.byIcon(Icons.casino), findsOneWidget);

    final jokeType = 'Programming';

    expect(find.text(jokeType), findsOneWidget);

    await tester.tap(find.text(jokeType));
    await tester.pumpAndSettle();

    expect(find.text('Programming'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.casino));
    await tester.pumpAndSettle();

    expect(find.text('Random Joke of the Day'), findsOneWidget);

    expect(find.byType(Text), findsWidgets);
  });
}
