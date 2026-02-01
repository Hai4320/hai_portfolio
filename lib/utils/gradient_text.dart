import 'package:flutter/material.dart';

extension GradientText on Text {
  Widget gradient() {
    return GradientAnimationText(
      text: this,
      duration: const Duration(seconds: 40),
      reverse: true,
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

class GradientAnimationText extends StatefulWidget {
  // data members
  final Text text;
  final List<Color> colors;
  final Duration duration;
  final bool? reverse;
  final GradientTransform? transform;

  // constructor
  const GradientAnimationText({
    required this.text,
    required this.colors,
    required this.duration,
    this.reverse,
    this.transform,
    super.key,
  });

  @override
  State<GradientAnimationText> createState() => _GradientAnimationTextState();
}

class _GradientAnimationTextState extends State<GradientAnimationText> with SingleTickerProviderStateMixin {
  // data members
  late AnimationController _animationController;
  late Animation _animation;
  late List<Color> colors;
  late int n;
  late double diff;

  @override
  void initState() {
    super.initState();
    // animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // repeating animation
    _animationController.repeat(reverse: widget.reverse ?? false);

    // animation
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    // colors
    colors = [];
    colors.add(widget.colors.last);
    colors.addAll(widget.colors);
    colors.addAll(widget.colors);

    // colors length
    n = widget.colors.length;

    // diff
    diff = (1 / n);
  }

  // creates stops dynamically based on the animation value
  List<double> stopsList() {
    int multiplier = -1 * n;
    List<double> stops = [];

    // generates (2*n + 1) stops
    while (multiplier <= n) {
      stops.add(_animation.value + (multiplier * diff));
      multiplier++;
    }

    return stops;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = widget.text;
    return ShaderMask(
      child: Text(
        text.data!,
        key: text.key,
        locale: text.locale,
        maxLines: text.maxLines,
        overflow: text.overflow,
        textAlign: text.textAlign,
        selectionColor: text.selectionColor,
        semanticsLabel: text.semanticsLabel,
        softWrap: text.softWrap,
        strutStyle: text.strutStyle,
        style: (text.style != null) ? text.style!.copyWith(color: Colors.white) : const TextStyle(color: Colors.white),
        textDirection: text.textDirection,
        textHeightBehavior: text.textHeightBehavior,
        textScaler: text.textScaler,
        textWidthBasis: text.textWidthBasis,
      ),
      shaderCallback: (rect) {
        // gradient
        return LinearGradient(
          tileMode: TileMode.clamp,
          transform: widget.transform,
          stops: stopsList(),
          colors: colors,
        ).createShader(Rect.fromCenter(center: rect.center, width: rect.width * 5, height: rect.height * 5));
      },
    );
  }
}
