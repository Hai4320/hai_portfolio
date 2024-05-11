import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';

extension GradientText on Text {
  Widget gradient() {
    return GradientAnimationText(
      text: this,
      duration: const Duration(seconds: 10),
      reverse: true,
       transform: const GradientRotation(76 * math.pi / 180),
      colors: const [
        Color(0xFFFDE1FF),
        Color(0xFFE0E7FF),
        Color(0xFFE0F9FF),
        Color(0xFFFFFAE9),
        Color(0xFFE8EAFF),
        Color(0xFFFFE3F7),
        Color(0xFFDAF1FF),
        Color(0xFFFDE1FF),
        Color(0xFFE0E7FF),
        Color(0xFFE0F9FF),
        Color(0xFFFFFAE9),
        Color(0xFFE8EAFF),
        Color(0xFFFFE3F7),
        Color(0xFFDAF1FF),
        Color(0xFFFDE1FF),
        Color(0xFFE0E7FF),
        Color(0xFFE0F9FF),
        Color(0xFFFFFAE9),
        Color(0xFFE8EAFF),
        Color(0xFFFFE3F7),
        Color(0xFFDAF1FF),
      ],
    );
  }
}
