import 'package:flutter/material.dart';

enum StatusIndicatorStyle { dot, ring, semicircle }

enum StatusIndicatorAlignment { topLeft, topRight, bottomLeft, bottomRight }

class StatusIndicatorSettings {
  final bool isOnline;
  final StatusIndicatorStyle style;
  final Color onlineColor;
  final Color offlineColor;
  final double size;
  final EdgeInsets padding;
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;
  final bool showShadow;
  final Color shadowColor;
  final Offset shadowOffset;
  final double shadowBlurRadius;

  // پراپرتی جدید برای تعیین موقعیت نشانگر وضعیت
  final StatusIndicatorAlignment alignment;

  const StatusIndicatorSettings({
    this.isOnline = false,
    this.style = StatusIndicatorStyle.dot,
    this.onlineColor = Colors.green,
    this.offlineColor = Colors.grey,
    this.size = 12.0,
    this.padding = const EdgeInsets.all(2.0),
    this.showBorder = true,
    this.borderColor = Colors.white,
    this.borderWidth = 2.0,
    this.showShadow = true,
    this.shadowColor = Colors.black,
    this.shadowOffset = const Offset(0, 2),
    this.shadowBlurRadius = 4.0,
    this.alignment = StatusIndicatorAlignment.bottomRight, // مقدار پیش‌فرض
  });

  // کپی کردن با تغییرات جدید
  StatusIndicatorSettings copyWith({
    bool? isOnline,
    StatusIndicatorStyle? style,
    Color? onlineColor,
    Color? offlineColor,
    double? size,
    EdgeInsets? padding,
    bool? showBorder,
    Color? borderColor,
    double? borderWidth,
    bool? showShadow,
    Color? shadowColor,
    Offset? shadowOffset,
    double? shadowBlurRadius,
    StatusIndicatorAlignment? alignment, // اضافه کردن پراپرتی جدید
  }) {
    return StatusIndicatorSettings(
      isOnline: isOnline ?? this.isOnline,
      style: style ?? this.style,
      onlineColor: onlineColor ?? this.onlineColor,
      offlineColor: offlineColor ?? this.offlineColor,
      size: size ?? this.size,
      padding: padding ?? this.padding,
      showBorder: showBorder ?? this.showBorder,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      showShadow: showShadow ?? this.showShadow,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      alignment: alignment ?? this.alignment, // کپی پراپرتی جدید
    );
  }

  // گرفتن رنگ فعلی بر اساس وضعیت
  Color get currentColor => isOnline ? onlineColor : offlineColor;

  // گرفتن سایه در صورت فعال بودن
  List<BoxShadow>? get shadow => showShadow
      ? [
          BoxShadow(
            color: shadowColor.withValues(alpha: 0.2),
            blurRadius: shadowBlurRadius,
            offset: shadowOffset,
          ),
        ]
      : null;

  // گرفتن بوردر در صورت فعال بودن
  Border? get border =>
      showBorder ? Border.all(color: borderColor, width: borderWidth) : null;
}
