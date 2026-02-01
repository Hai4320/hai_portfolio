import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageLink extends StatefulWidget {
  const ImageLink({super.key, required this.imageSvg, required this.link});

  final String imageSvg;
  final String link;

  @override
  State<ImageLink> createState() => _ImageLinkState();
}

class _ImageLinkState extends State<ImageLink> {
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
        child: AnimatedScale(
          scale: hovering ? 1.2 : 1,
          duration: const Duration(milliseconds: 200),
          child: SvgPicture.asset(
            widget.imageSvg,
            height: 30,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
