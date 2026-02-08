import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/ui/screens/home/viewer_controller.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';

class SectionItemMobile {
  final String label;
  final IconData icon;
  final GlobalKey key;

  SectionItemMobile({required this.label, required this.icon, required this.key});
}

class FloatingNavMobile extends StatefulWidget {
  final List<SectionItemMobile> sections;

  const FloatingNavMobile({super.key, required this.sections});

  @override
  State<FloatingNavMobile> createState() => _FloatingNavMobileState();
}

class _FloatingNavMobileState extends State<FloatingNavMobile> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggle() {
    if (!mounted) return;
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void _scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(ctx, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
    _toggle();
  }

  String _formatViewerCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 24,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Expanded menu items - icons only
          AnimatedBuilder(
            animation: _expandAnimation,
            builder: (context, child) {
              if (!mounted) return const SizedBox.shrink();
              final value = _expandAnimation.value;
              return Opacity(
                opacity: value,
                child: Transform.scale(scale: value, alignment: Alignment.bottomCenter, child: child),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.richBlack,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: AppColors.lightPeriwinkle.withValues(alpha: 0.2), width: 1),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 16, offset: const Offset(0, 4)),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Section icons
                  ...widget.sections.map((section) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => _scrollToSection(section.key),
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            child: Icon(section.icon, size: 20, color: AppColors.lightPeriwinkle),
                          ),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 4),
                  Container(height: 1, width: 24, color: AppColors.lightPeriwinkle.withValues(alpha: 0.2)),
                  const SizedBox(height: 4),
                  // Viewer counter icon at bottom
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: GetX<ViewerController>(
                        builder: (controller) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.visibility_outlined, size: 18, color: AppColors.lightPeriwinkle),
                              const SizedBox(height: 2),
                              Text(
                                _formatViewerCount(controller.viewerCount.value),
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: AppColors.lightPeriwinkle,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Main FAB button
          GestureDetector(
            onTap: _toggle,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                gradient: _isExpanded
                    ? null
                    : const LinearGradient(
                        colors: [Color(0xff7F7FD5), Color(0xff86A8E7), Color(0xff91EAE4)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                color: _isExpanded ? AppColors.richBlack : null,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(
                  color: _isExpanded ? AppColors.lightPeriwinkle.withValues(alpha: 0.3) : Colors.transparent,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _isExpanded
                        ? Colors.black.withValues(alpha: 0.3)
                        : const Color(0xff7F7FD5).withValues(alpha: 0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: AnimatedRotation(
                turns: _isExpanded ? 0.125 : 0,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  _isExpanded ? Icons.close_rounded : Icons.navigation_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
