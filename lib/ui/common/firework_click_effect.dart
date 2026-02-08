import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';

/// A widget that displays simple particle effects when user clicks/taps
class FireworkClickEffect extends StatefulWidget {
  const FireworkClickEffect({super.key, required this.child});

  final Widget child;

  @override
  State<FireworkClickEffect> createState() => _FireworkClickEffectState();
}

class _FireworkClickEffectState extends State<FireworkClickEffect> {
  final List<FireworkData> _fireworks = [];

  void _addFirework(Offset position) {
    final firework = FireworkData(
      position: position,
      key: UniqueKey(),
    );
    setState(() {
      _fireworks.add(firework);
    });
  }

  void _removeFirework(Key key) {
    setState(() {
      _fireworks.removeWhere((f) => f.key == key);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        _addFirework(event.position);
      },
      behavior: HitTestBehavior.translucent,
      child: Stack(
        children: [
          widget.child,
          ..._fireworks.map((firework) => FireworkWidget(
                key: firework.key,
                position: firework.position,
                onComplete: () => _removeFirework(firework.key),
              )),
        ],
      ),
    );
  }
}

class FireworkData {
  final Offset position;
  final Key key;

  FireworkData({required this.position, required this.key});
}

class FireworkWidget extends StatefulWidget {
  const FireworkWidget({
    super.key,
    required this.position,
    required this.onComplete,
  });

  final Offset position;
  final VoidCallback onComplete;

  @override
  State<FireworkWidget> createState() => _FireworkWidgetState();
}

class _FireworkWidgetState extends State<FireworkWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> _particles;
  final Random _random = Random();

  // Simple color palette matching app theme
  final List<Color> _colors = [
    AppColors.lightPeriwinkle,
    Colors.white,
    AppColors.lightPeriwinkle.withValues(alpha: 0.7),
    const Color(0xFFE0E7FF), // Soft lavender
    const Color(0xFFDDD6FE), // Light violet
    const Color(0xFFC4B5FD), // Medium purple
    const Color(0xFFE0F2FE), // Light sky blue
  ];

  @override
  void initState() {
    super.initState();
    _initParticles();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onComplete();
        }
      });
    _controller.forward();
  }

  void _initParticles() {
    final particleCount = 8 + _random.nextInt(5); // 8-12 particles (simpler)

    _particles = List.generate(particleCount, (index) {
      final angle = (2 * pi * index / particleCount);
      final velocity = 40 + _random.nextDouble() * 30; // Shorter distance
      final size = 2 + _random.nextDouble() * 2; // Smaller particles
      final color = _colors[_random.nextInt(_colors.length)];
      final gravity = 60 + _random.nextDouble() * 30; // Gravity effect

      return Particle(
        angle: angle,
        velocity: velocity,
        size: size,
        color: color,
        gravity: gravity,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: FireworkPainter(
            particles: _particles,
            progress: _controller.value,
            center: widget.position,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class Particle {
  final double angle;
  final double velocity;
  final double size;
  final Color color;
  final double gravity;

  Particle({
    required this.angle,
    required this.velocity,
    required this.size,
    required this.color,
    required this.gravity,
  });
}

class FireworkPainter extends CustomPainter {
  final List<Particle> particles;
  final double progress;
  final Offset center;

  FireworkPainter({
    required this.particles,
    required this.progress,
    required this.center,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in particles) {
      final easedProgress = Curves.easeOut.transform(progress);

      // Movement with gravity
      final distance = particle.velocity * easedProgress;
      final gravityOffset = particle.gravity * progress * progress; // Quadratic gravity

      final dx = cos(particle.angle) * distance;
      final dy = sin(particle.angle) * distance + gravityOffset;

      final particlePos = center + Offset(dx, dy);

      // Simple fade out
      final opacity = 1 - progress;
      final currentSize = particle.size * (1 - progress * 0.3);

      if (opacity > 0.01) {
        final paint = Paint()
          ..color = particle.color.withValues(alpha: opacity.clamp(0.0, 1.0))
          ..style = PaintingStyle.fill;

        // Draw simple dot
        canvas.drawCircle(
          particlePos,
          currentSize,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(FireworkPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

