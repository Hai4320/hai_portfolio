import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/data/repository/link_analytics_repository.dart';
import 'package:hai_portfolio/data/service/link_analytics_service.dart';

class ImageLink extends StatefulWidget {
  const ImageLink({
    super.key,
    required this.imageSvg,
    required this.link,
    this.linkType = LinkType.other,
    this.linkName,
  });

  final String imageSvg;
  final String link;
  final LinkType linkType;
  final String? linkName;

  @override
  State<ImageLink> createState() => _ImageLinkState();
}

class _ImageLinkState extends State<ImageLink> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<LinkAnalyticsService>().openLink(
          url: widget.link,
          linkType: widget.linkType,
          linkText: widget.linkName,
        );
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
