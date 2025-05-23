import 'dart:io';

import 'package:avatar_better_pro/avatar_better_pro.dart';
import 'package:avatar_example/avatar_test.dart';
import 'package:flutter/material.dart';

class AvatarExample extends StatefulWidget {
  const AvatarExample({Key? key}) : super(key: key);

  @override
  State<AvatarExample> createState() => _AvatarExampleState();
}

class _AvatarExampleState extends State<AvatarExample> {
  File? image;

  static List<String> alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  List<String> avatar =
      List.generate(52, (index) => "${alphabet[index]} avatar ${index + 1} ");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: avatar.length,
            itemBuilder: (context, index) {
              // Check if the index is within the bounds of the list
              if (index < avatar.length) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Avatar(
                        // onTapAvatar: () {},
                        radius: 35,
                        text: avatar[index],
                        randomGradient: true,
                        randomColor: false,
                        useMaterialColorForGradient: true,
                        mixColorForGradient: false,
                        isBorderAvatar: true,
                        widthBorder: 5,
                        gradientWidthBorder: const LinearGradient(colors: [
                          Colors.amber,
                          Colors.orangeAccent,
                          Colors.deepOrangeAccent
                        ]),
                        showStatusSettings: true,
                        statusSettings: const StatusIndicatorSettings(
                          borderColor: Colors.pink,
                          size: 15,
                          padding: EdgeInsets.all(2),
                          borderWidth: 1,
                          showBorder: true,
                          isOnline: true,
                          showShadow: true,
                          shadowColor: Colors.amberAccent,
                          shadowOffset: Offset(1, 1),
                          shadowBlurRadius: 2,
                          onlineColor: Colors.greenAccent,
                          offlineColor: Colors.redAccent,
                          style: StatusIndicatorStyle.dot,
                          alignment: StatusIndicatorAlignment.bottomRight,
                        ),
                        // onTapAvatar: () {},
                        child: const Icon(Icons.person),
                        /*   bottomSheetStyles: BottomSheetStyles(
                          galleryButton: GalleryBottom(
                              style: const TextStyle(),
                              color: Colors.amber,
                              text: 'Gallery',
                              icon: const Icon(Icons.image_outlined)),
                          cameraButton: CameraButton(
                              style: const TextStyle(),
                              color: Colors.amber,
                              text: 'Camera',
                              icon: const Icon(Icons.camera_alt_outlined)),
                          backgroundColor: Colors.amberAccent,
                          elevation: 2,
                          middleText: 'OR',
                          middleTextStyle: const TextStyle(),
                        ),*/
                      ),
                      Text(avatar[index]),
                    ],
                  ),
                );
              } else {
                // Return a placeholder widget if the index is out of bounds
                return Container();
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AvatarTest(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
