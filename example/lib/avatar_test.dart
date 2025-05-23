import 'package:avatar_better_pro/avatar_better_pro.dart';
import 'package:flutter/material.dart';

class AvatarTest extends StatelessWidget {
  const AvatarTest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AvatarTest'),
      ),
      body: Column(
        spacing: 25,
        children: [
          Center(
            child: Avatar(text: "GGHHjdjwe"),
          ),
          Center(
            child: Avatar.profile(text: "GGHHjdjwe"),
          ),
        ],
      ),
    );
  }
}
