import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hai_portfolio/ui/screens/home/widgets/viewer_counter_widget.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';

class SectionItem {
  final String label;
  final IconData icon;
  final GlobalKey key;

  SectionItem({required this.label, required this.icon, required this.key});
}

class FloatingNav extends StatefulWidget {
  final List<SectionItem> sections;

  const FloatingNav({super.key, required this.sections});

  @override
  State<FloatingNav> createState() => _FloatingNavState();
}

class _FloatingNavState extends State<FloatingNav> {
  int? _hoveredIndex;
  bool _isViewerHovered = false;

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      bottom: 0,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(right: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Navigation Menu
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
                decoration: BoxDecoration(
                  color: AppColors.richBlack.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.lightPeriwinkle.withValues(alpha: 0.2), width: 1),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(-4, 0)),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(widget.sections.length, (index) {
                    final section = widget.sections[index];
                    final isHovered = _hoveredIndex == index;

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: MouseRegion(
                        onEnter: (_) => setState(() => _hoveredIndex = index),
                        onExit: (_) => setState(() => _hoveredIndex = null),
                        child: GestureDetector(
                          onTap: () => _scrollToSection(section.key),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            clipBehavior: Clip.none,
                            children: [
                              // Icon - always in the same position
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  gradient: isHovered
                                      ? const LinearGradient(
                                          colors: [Color(0xff7F7FD5), Color(0xff86A8E7), Color(0xff91EAE4)],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        )
                                      : null,
                                  color: isHovered ? null : Colors.transparent,
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: Icon(
                                  section.icon,
                                  color: isHovered ? Colors.white : AppColors.lightPeriwinkle.withValues(alpha: 0.7),
                                  size: 22,
                                ),
                              ),
                              // Label - positioned to the left of icon
                              Positioned(
                                right: 52,
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 200),
                                  opacity: isHovered ? 1.0 : 0.0,
                                  child: AnimatedSlide(
                                    duration: const Duration(milliseconds: 200),
                                    offset: isHovered ? Offset.zero : const Offset(0.5, 0),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(colors: [Color(0xff7F7FD5), Color(0xff86A8E7)]),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        section.label,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 16.h),
              // Viewer Counter - separate floating box below menu
              MouseRegion(
                onEnter: (_) => setState(() => _isViewerHovered = true),
                onExit: (_) => setState(() => _isViewerHovered = false),
                child: Stack(
                  alignment: Alignment.centerRight,
                  clipBehavior: Clip.none,
                  children: [
                    // Icon container
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        gradient: _isViewerHovered
                            ? const LinearGradient(
                                colors: [Color(0xff7F7FD5), Color(0xff86A8E7), Color(0xff91EAE4)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                            : null,
                        color: _isViewerHovered ? null : AppColors.richBlack.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: _isViewerHovered
                              ? Colors.transparent
                              : AppColors.lightPeriwinkle.withValues(alpha: 0.2),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: _isViewerHovered
                                ? const Color(0xff7F7FD5).withValues(alpha: 0.4)
                                : Colors.black.withValues(alpha: 0.3),
                            blurRadius: 12,
                            offset: const Offset(-2, 0),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.visibility_outlined,
                        color: _isViewerHovered ? Colors.white : AppColors.lightPeriwinkle.withValues(alpha: 0.7),
                        size: 22,
                      ),
                    ),
                    // Viewer count label - appears on hover
                    Positioned(
                      right: 52,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: _isViewerHovered ? 1.0 : 0.0,
                        child: AnimatedSlide(
                          duration: const Duration(milliseconds: 200),
                          offset: _isViewerHovered ? Offset.zero : const Offset(0.5, 0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [Color(0xff7F7FD5), Color(0xff86A8E7)]),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const ViewerCounterWidget(
                              fontSize: 12,
                              iconColor: Colors.white,
                              textColor: Colors.white,
                              isCompact: true,
                              hideIcon: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
