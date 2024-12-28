// ignore_for_file: must_be_immutable

library;

import 'dart:io';
import 'dart:math' show pi, cos, sin;

import 'package:avatar_better_pro/src/tools/gradient_circle_painter.dart';
import 'package:avatar_better_pro/src/tools/status_indicator_settings.dart';
import 'package:flutter/material.dart';

import 'src/profile.dart';
import 'src/tools/bottom_sheet_styles.dart';
import 'src/tools/gradiant_random_tools.dart';
import 'src/tools/text_to_color.dart';

export 'package:avatar_better_pro/src/tools/bottom_sheet_styles.dart';
export 'package:avatar_better_pro/src/tools/gallery_buttom.dart';
export 'package:avatar_better_pro/src/tools/status_indicator_settings.dart';

typedef OnPickerChange = void Function(File file);

extension AvatarCircleExtensions on Avatar {
  static String initials(String text) {
    String result = "";
    List<String> words = text.split(" ");
    for (var text in words) {
      if (text.trim().isNotEmpty && result.length < 2) {
        result += text[0].trim();
      }
    }
    return result.trim().toUpperCase();
  }
}

/// A widget that displays an avatar image.
///
///Example:
///
///```dart
///Avatar(
///onTapAvatar: () {},//With this function, you can display page shift or page view in a personalized way.
///text: avatar[index],
///radius: 35,
///randomGradient: true,
///randomColor: false,
///imageNetwork: "https://images.unsplash.com/photo-1616731948638-b0d0befef759?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
/// showPageViewOnTap: true, //By activating this option, the user can see the avatar images in the page view.
/// )
/// ```
/// [text]: The text to display on the avatar.
///
/// [widthBorder]: The border width of the avatar (default: 0.0).
///
/// [radius]: The radius of the avatar size.
///
/// [image]: The imageAssets for the avatar.
///
/// [imageNetwork]: The image URL for the avatar.
///
/// [backgroundColor]: The background color of the avatar (can be null).
///
/// [gradientBackgroundColor]: The gradient background of the avatar (can be null).
///
/// [gradientWidthBorder]: The gradient for the avatar's border (default: linear gradient from blue to deep purple).

class Avatar extends StatefulWidget {
  /// [onTapAvatar]: A callback function for when the avatar is tapped.
  final void Function()? onTapAvatar;

  /// [widthBorder]: The border width of the profile (default: 0.0).
  final double widthBorder;

  /// [radius]: The radius of the profile size.
  final double? radius;

  /// [image]: The imageAssets for the profile.
  final String? image;

  /// [imageNetwork]: The image URL list for pageView  profile.
  final String? imageNetwork;

  /// [listImageNetwork]: The images URL for the profile.
  final List<String>? listImageNetwork;

  /// [backgroundColor]: The background color of the profile (can be null).
  Color? backgroundColor;

  /// [gradientBackgroundColor]: The gradient background of the profile (can be null).
  Gradient? gradientBackgroundColor;

  /// [gradientWidthBorder]: The gradient for the profile's border (default: linear gradient from blue to deep purple).
  final Gradient? gradientWidthBorder;

  /// [elevation]: create shadow widget  (can be null).
  final double elevation;

  ///[shadowColor]: elevation color .
  final Color? shadowColor;

  /// [text]: The text to display on the profile.
  final String? text;

  /// [style]: The text style (default: font size 25, white color, and bold).
  final TextStyle? style;

  /// The [isBorderAvatar] parameter, if true, creates a border for the avatar.
  /// This border contains a circular border with a default width of 5 and a color of [LinearGradient].
  /// If this parameter is false, no border will be created for the avatar.
  final bool isBorderAvatar;

  /// [useMaterialColorForGradient] : use material color for gradient. Default = true
  final bool useMaterialColorForGradient;

  /// [mixColorForGradient] : mix color for gradient. Default = false
  final bool mixColorForGradient;

  /// [showStatusSettings] : show status settings. Default = false
  final bool showStatusSettings;

  /// [statusSettings]: The status indicator settings for the avatar.
  final StatusIndicatorSettings? statusSettings;

  /// [child]: The child widget to display inside the avatar.
  final Widget? child;

  Avatar({
    super.key,
    required this.text,
    this.onTapAvatar,
    this.radius = 35,
    this.image,
    this.imageNetwork,
    this.listImageNetwork,
    this.backgroundColor,
    this.gradientBackgroundColor,
    this.shadowColor = Colors.black,
    this.gradientWidthBorder =
        const LinearGradient(colors: [Colors.blue, Colors.deepPurple]),
    this.elevation = 0,
    this.widthBorder = 0.0,
    this.isBorderAvatar = false,
    this.useMaterialColorForGradient = true,
    this.mixColorForGradient = false,
    this.showStatusSettings = false,
    this.statusSettings,
    this.child,
    this.style = const TextStyle(
        fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
    bool randomColor = true,
    bool randomGradient = false,
  }) {
    if (randomColor) {
      backgroundColor = TextToColor.toColor(text);
    } else if (randomGradient) {
      gradientBackgroundColor =
          GradientRandomTools.getGradient(text.toString(), material: true);
    } else {
      backgroundColor = backgroundColor;
    }
  }

  static Widget profile(
      {
      /// [text]: The text to display on the profile.
      required String? text,

      /// [widthBorder]: The border width of the profile [widthBorder = 0.0].
      final double widthBorder = 0.0,

      /// [radius]: The radius of the profile [radius = 35].
      double? radius = 35,

      /// [image]: The imageAssets for the profile.
      final String? image,

      /// [imageNetwork]: The image URL for the profile.
      final String? imageNetwork,

      /// [backgroundColor]: The background color of the profile (can be null).
      Color? backgroundColor,

      /// [gradientBackgroundColor]: The gradient background of the profile (can be null).
      Gradient? gradientBackgroundColor,

      /// [gradientWidthBorder]: The gradient for the profile's border (default: linear gradient from blue to deep purple).
      Gradient? gradientWidthBorder =
          const LinearGradient(colors: [Colors.blue, Colors.deepPurple]),

      /// [style]: The text style (default: font size 25, white color, and bold).
      final TextStyle? style = const TextStyle(
          fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),

      /// [backgroundColorCamera] : color background picker
      final Color backgroundColorCamera = Colors.white,

      /// [icon]: icon picker
      final IconData? icon = Icons.camera,

      /// [iconColor]: color picker icon
      final Color iconColor = Colors.black,

      /// [randomColor]: A boolean flag for randomizing the background color of the profile.
      bool randomColor = true,

      /// [randomGradient]: A boolean flag for randomizing the background gradient of the profile.
      bool randomGradient = false,

      ///[elevation]: elevation color.
      final double elevation = 0,

      /// [shadowColor]: create shadow widget  (can be null).
      final Color shadowColor = Colors.black,

      ///[onPickerChange ]:is an optional property in the [Picker] class that allows you to call a callback when the picker value changes.
      /// This callback has a parameter named value that passes the new value of the picker to it.
      final OnPickerChange? onPickerChange,

      /// The [isBorderAvatar] parameter, if true, creates a border for the avatar.
      /// This border contains a circular border with a default width of 5 and a color of LinearGradient.
      /// If this parameter is false, no border will be created for the avatar.
      final bool isBorderAvatar = false,

      /// This section of code pertains to the definition of a callback that is invoked when a file is selected by the user.
      ///
      /// `OnPickerChangeWeb` is a data type representing a function that takes an argument of type `Uint8List` and returns nothing (`void`).
      ///
      /// This callback is used as a parameter in a function or class responsible for file selection or change. When a user selects a file and the selection process completes, this callback is invoked, and the selected file is passed to it as an argument.
      ///
      /// The default value for this parameter is `null`, but you can specify a function as a default value to be called if no function is selected.
      final OnPickerChangeWeb? onPickerChangeWeb,

      /// [BottomSheetStyles] : Configuration for customizing the bottom sheet's appearance and behavior.
      final BottomSheetStyles? bottomSheetStyles,

      /// [useMaterialColorForGradient] : use material color for gradient
      final bool useMaterialColorForGradient = true,

      /// [mixColorForGradient] : mix color for gradient
      final bool mixColorForGradient = false,

      /// [child] : child widget
      final Widget? child}) {
    if (randomColor) {
      backgroundColor = TextToColor.toColor(text!);
    } else if (randomGradient) {
      gradientBackgroundColor = GradientRandomTools.getGradient(text.toString(),
          material: useMaterialColorForGradient,
          dynamicMix: mixColorForGradient);
    } else {
      backgroundColor = backgroundColor;
    }
    return Profile(
      widthBorder: widthBorder,
      radius: radius,
      image: image,
      imageNetwork: imageNetwork,
      backgroundColor: backgroundColor,
      gradientWidthBorder: gradientWidthBorder,
      gradientBackgroundColor: gradientBackgroundColor,
      text: text,
      style: style,
      backgroundColorCamera: backgroundColorCamera,
      icon: icon,
      iconColor: iconColor,
      randomColor: randomColor,
      randomGradient: randomGradient,
      onPickerChange: onPickerChange,
      isBorderAvatar: isBorderAvatar,
      shadowColor: shadowColor,
      elevation: elevation,
      onPickerChangeWeb: onPickerChangeWeb,
      bottomSheetStyles: bottomSheetStyles,
      useMaterialColorForGradient: useMaterialColorForGradient,
      mixColorForGradient: mixColorForGradient,
      child: child,
    );
  }

  @override
  State<Avatar> createState() => _AvatarState();
  static List<DropdownMenuItem<String>> defaultItemsBuilder(int index) {
    return [];
  }
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    File? imagePicker;
    final double avatarSize = widget.radius != null ? widget.radius! * 2.2 : 35;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkResponse(
          onTap: widget.onTapAvatar,
          child: widget.isBorderAvatar
              ? _buildBorderedAvatar(imagePicker)
              : _buildSimpleAvatar(imagePicker),
        ),
        if (widget.showStatusSettings &&
            widget.statusSettings != null) // بررسی پراپرتی جدید
          _buildEdgeStatusIndicator(avatarSize),
      ],
    );
  }

  Widget _buildEdgeStatusIndicator(double avatarSize) {
    final settings = widget.statusSettings!;
    final borderOffset = widget.isBorderAvatar ? widget.widthBorder : 0;
    final avatarRadius = avatarSize / 2;
    final indicatorRadius = settings.size / 2;

    // زاویه موقعیت‌یابی دایره وضعیت
    double angle;
    switch (settings.alignment) {
      case StatusIndicatorAlignment.topRight:
        angle = -45 * pi / 180; // -45 درجه
        break;
      case StatusIndicatorAlignment.bottomRight:
        angle = 45 * pi / 180; // 45 درجه
        break;
      case StatusIndicatorAlignment.bottomLeft:
        angle = 135 * pi / 180; // 135 درجه
        break;
      case StatusIndicatorAlignment.topLeft:
        angle = 225 * pi / 180; // 225 درجه
        break;
    }

    // محاسبه مختصات با تنظیم برای کمی داخل‌تر رفتن دایره وضعیت
    final x =
        avatarRadius + (avatarRadius + indicatorRadius * 0.30) * cos(angle);
    final y =
        avatarRadius + (avatarRadius + indicatorRadius * 0.30) * sin(angle);

    return Positioned(
      left: x - indicatorRadius + borderOffset - 1.8,
      top: y - indicatorRadius + borderOffset - 1.8,
      child: SizedBox(
        width: settings.size,
        height: settings.size,
        child: _getStatusIndicator(),
      ),
    );
  }

  Widget _getStatusIndicator() {
    final settings = widget.statusSettings;
    if (settings == null) return const SizedBox.shrink();

    final color = settings.currentColor;

    switch (settings.style) {
      case StatusIndicatorStyle.dot:
        return Container(
          width: settings.size,
          height: settings.size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: settings.border,
            boxShadow: settings.shadow,
          ),
        );

      case StatusIndicatorStyle.ring:
        return Container(
          width: settings.size,
          height: settings.size,
          decoration: BoxDecoration(
            color: settings.borderColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
              width: settings.borderWidth,
            ),
            boxShadow: settings.shadow,
          ),
        );

      case StatusIndicatorStyle.semicircle:
        return Container(
          width: settings.size,
          height: settings.size / 2,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(settings.size / 2),
            border: settings.border,
            boxShadow: settings.shadow,
          ),
        );
    }
  }

  Widget _buildBorderedAvatar(File? imagePicker) {
    return CustomPaint(
      painter: GradientCirclePainter(
        gradientColors: widget.gradientWidthBorder,
        withBorder: widget.widthBorder,
      ),
      child: Padding(
        padding: EdgeInsets.all(widget.widthBorder),
        child: _buildAvatarContent(imagePicker),
      ),
    );
  }

  Widget _buildSimpleAvatar(File? imagePicker) {
    return _buildAvatarContent(imagePicker);
  }

  Widget _buildAvatarContent(File? imagePicker) {
    final double avatarSize = widget.radius != null ? widget.radius! * 2.2 : 35;

    return Material(
      type: MaterialType.circle,
      elevation: widget.elevation,
      shadowColor: widget.shadowColor,
      color: Colors.transparent,
      child: Container(
        width: avatarSize,
        height: avatarSize,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          gradient: widget.gradientBackgroundColor,
          shape: BoxShape.circle,
          image: _getDecorationImage(imagePicker),
        ),
        child: _buildAvatarChild(imagePicker),
      ),
    );
  }

  DecorationImage? _getDecorationImage(File? imagePicker) {
    if (imagePicker != null) {
      return DecorationImage(
        image: FileImage(imagePicker),
        fit: BoxFit.cover,
      );
    } else if (widget.imageNetwork != null || widget.listImageNetwork != null) {
      return DecorationImage(
        image: Image.network(widget.imageNetwork != null
                ? widget.imageNetwork!
                : widget.listImageNetwork!.last)
            .image,
        fit: BoxFit.cover,
      );
    } else if (widget.image != null) {
      return DecorationImage(
        image: Image.asset(widget.image!).image,
        fit: BoxFit.cover,
      );
    }
    return null;
  }

  Widget _buildAvatarChild(File? imagePicker) {
    if (imagePicker == null &&
        widget.imageNetwork == null &&
        widget.image == null &&
        widget.listImageNetwork == null &&
        widget.text != null) {
      return widget.child ??
          Text(
            AvatarCircleExtensions.initials(widget.text!),
            style: widget.style,
          );
    }
    return const Text('');
  }
}
