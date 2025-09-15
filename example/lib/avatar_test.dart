import 'dart:io';
import 'dart:typed_data';

import 'package:avatar_better_pro/avatar_better_pro.dart';
import 'package:flutter/material.dart';

class AvatarTest extends StatefulWidget {
  const AvatarTest({super.key});

  @override
  State<AvatarTest> createState() => _AvatarTestState();
}

class _AvatarTestState extends State<AvatarTest> {
  File? image;
  Uint8List? imageBytes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AvatarTest')),
      body: Column(
        spacing: 25,
        children: [
          Center(child: Avatar(text: "GGHHjdjwe")),
          Center(
            child: Avatar.profile(
              text: "GGHHjdjwe",
              onPickerChange: (file, bytes) {
                setState(() {
                  image = file;
                  imageBytes = bytes;
                });
              },
            ),
          ),
          if (image != null) Image.file(image!, height: 150, width: 150),
          if (imageBytes != null) Image.memory(imageBytes!, height: 150, width: 150),
        ],
      ),
    );
  }
}
