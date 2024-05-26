import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class TextLink extends StatefulWidget {
  const TextLink({
    super.key,
    required this.text,
    required this.link,
    this.style,
  });

  final String text;
  final String link;
  final TextStyle? style;

  @override
  State<TextLink> createState() => _TextLinkState();
}

class _TextLinkState extends State<TextLink> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse(widget.link), webOnlyWindowName: '_blank');
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
              scale: hovering ? 0.95 : 1,
              duration: const Duration(milliseconds: 200),
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 17,
                  color: AppColors.white,
                ),
              ),
            ),
           Positioned(
                left: 0,
                bottom: 0,
                child: AnimatedContainer(
                  height: 10,
                  width: hovering ? 50 : 0,
                  decoration: BoxDecoration(
                    color: AppColors.lightPeriwinkle.withOpacity(0.5),
                  ),
                  duration: const Duration(milliseconds: 200),
                ),
              )
          ],
        ),
      ),
    );
  }
}
