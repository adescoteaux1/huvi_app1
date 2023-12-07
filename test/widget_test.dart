// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:huvi_app1/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final supabase = SupabaseClient(
        'https://jlaeonshmaqkwztitqld.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpsYWVvbnNobWFxa3d6dGl0cWxkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDEyODM1NDUsImV4cCI6MjAxNjg1OTU0NX0.vliW18yuZr34-2XdO36ahJorxJkotHkZiSwJRO3fhRE',
      );

    await tester.pumpWidget(MyApp(supabase: supabase));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
