import 'package:avatar_better_pro/avatar_better_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Avatar widget test', (WidgetTester tester) async {
    // Test that Avatar widget can be created and displays text initials
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: Avatar(text: 'John Doe', radius: 35)),
      ),
    );

    // Verify that the widget is rendered
    expect(find.byType(Avatar), findsOneWidget);
  });

  test('AvatarCircleExtensions initials test', () {
    // Test the initials extraction functionality
    expect(AvatarCircleExtensions.initials('John Doe'), 'JD');
    expect(AvatarCircleExtensions.initials('Alice'), 'A');
    expect(AvatarCircleExtensions.initials('Bob Smith Johnson'), 'BS');
    expect(AvatarCircleExtensions.initials(''), '');
  });
}
