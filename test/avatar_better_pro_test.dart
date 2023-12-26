import 'package:flutter_test/flutter_test.dart';

import 'package:avatar_better_pro/avatar_better_pro.dart';

void main() {
  test('adds one to input values', () {
    final testAvatar = Avatar.circle(text: "Hello World!");
    testAvatar.toString();

  });
}
