import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/data/repository/link_analytics_repository.dart';
import 'package:hai_portfolio/data/service/link_analytics_service.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';

class TextLink extends StatefulWidget {
  const TextLink({super.key, required this.text, required this.link, this.style, this.linkType = LinkType.other});

  final String text;
  final String link;
  final TextStyle? style;
  final LinkType linkType;

  @override
  State<TextLink> createState() => _TextLinkState();
}

class _TextLinkState extends State<TextLink> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<LinkAnalyticsService>().openLink(url: widget.link, linkType: widget.linkType, linkText: widget.text);
      },
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            hovering = true;
          });
        },
        onExit: (event) {
          setState(() {
            hovering = false;
          });
        },
        child: Stack(
          children: [
            AnimatedScale(
              scale: hovering ? 0.98 : 1,
              duration: const Duration(milliseconds: 200),
              child: Text(widget.text, style: TextStyle(fontSize: 17, color: AppColors.white)),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: AnimatedContainer(
                height: 10,
                width: hovering ? 50 : 0,
                decoration: BoxDecoration(color: AppColors.lightPeriwinkle.withValues(alpha: 0.5)),
                duration: const Duration(milliseconds: 200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
