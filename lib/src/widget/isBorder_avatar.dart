// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';

import '../profile.dart';

class IsBorderAvatar extends StatelessWidget {
  const IsBorderAvatar({super.key, required this.widget, required this.image});

  /// [widget]: The widget for the profile.
  final Profile widget;

  /// [image]: The image for the profile.
  final File? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: widget.gradientWidthBorder,
      ),
      padding: EdgeInsets.all(widget.widthBorder),
      child: Material(
        type: MaterialType.circle,
        elevation: widget.elevation,
        shadowColor: widget.shadowColor,
        color: Colors.transparent,
        borderRadius: null,
        child: Container(
          alignment: Alignment.center,
          height: widget.radius != null ? widget.radius! * 2 : 35,
          width: widget.radius != null ? widget.radius! * 2 : 35,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            gradient: widget.gradientBackgroundColor,
            shape: BoxShape.circle,
            image: image != null
                ? DecorationImage(image: FileImage(image!), fit: BoxFit.cover)
                : widget.imageNetwork != null
                ? DecorationImage(
                    image: Image.network(widget.imageNetwork!).image,
                    fit: BoxFit.cover,
                  )
                : widget.image != null
                ? DecorationImage(
                    image: Image.asset(widget.image!).image,
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child:
              (image == null &&
                  widget.imageNetwork == null &&
                  widget.image == null &&
                  widget.text != null)
              ? Text(
                  ProfileExtensions.initials(widget.text!),
                  style: widget.style,
                  textAlign: TextAlign.center,
                )
              : const Text(''),
        ),
      ),
    );
  }
}
