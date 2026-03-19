import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';

class ScreenshotCarousel extends StatefulWidget {
  final List<String> screenshotPaths;
  final double height;
  final double width;

  const ScreenshotCarousel({super.key, required this.screenshotPaths, this.height = 300, this.width = double.infinity});

  @override
  State<ScreenshotCarousel> createState() => _ScreenshotCarouselState();
}

class _ScreenshotCarouselState extends State<ScreenshotCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.screenshotPaths.isEmpty) {
      return Container(
        width: widget.width,
        height: widget.height.h,
        decoration: BoxDecoration(color: AppColors.richBlack, borderRadius: BorderRadius.circular(12.r)),
        child: Center(
          child: Text(
            'No screenshots available',
            style: TextStyle(color: AppColors.lightPeriwinkle.withAlpha(128), fontSize: 14.sp),
          ),
        ),
      );
    }

    return Column(
      children: [
        // Carousel
        Container(
          width: widget.width,
          height: widget.height.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemCount: widget.screenshotPaths.length,
            itemBuilder: (context, index) {
              return Image.asset(
                widget.screenshotPaths[index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.richBlack,
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: AppColors.lightPeriwinkle.withAlpha(128),
                        size: 48.r,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        // Page indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Previous button
            if (widget.screenshotPaths.length > 1)
              GestureDetector(
                onTap: () {
                  if (_currentPage > 0) {
                    _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  }
                },
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: _currentPage > 0 ? AppColors.lightPeriwinkle : AppColors.lightPeriwinkle.withAlpha(51),
                  size: 24.r,
                ),
              ),
            SizedBox(width: 16.w),
            // Indicators
            ...List.generate(
              widget.screenshotPaths.length,
              (index) => GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  width: _currentPage == index ? 24.w : 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? AppColors.lightPeriwinkle : AppColors.lightPeriwinkle.withAlpha(51),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            // Next button
            if (widget.screenshotPaths.length > 1)
              GestureDetector(
                onTap: () {
                  if (_currentPage < widget.screenshotPaths.length - 1) {
                    _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  }
                },
                child: Icon(
                  Icons.chevron_right_rounded,
                  color: _currentPage < widget.screenshotPaths.length - 1
                      ? AppColors.lightPeriwinkle
                      : AppColors.lightPeriwinkle.withAlpha(51),
                  size: 24.r,
                ),
              ),
          ],
        ),
        SizedBox(height: 8.h),
        // Page counter
        Text(
          '${_currentPage + 1} / ${widget.screenshotPaths.length}',
          style: TextStyle(fontSize: 12.sp, color: AppColors.lightPeriwinkle.withAlpha(128)),
        ),
      ],
    );
  }
}
