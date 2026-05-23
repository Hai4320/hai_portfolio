import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/data/model/project.dart';
import 'package:hai_portfolio/data/repository/link_analytics_repository.dart';
import 'package:hai_portfolio/data/service/link_analytics_service.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';
import 'package:hai_portfolio/utils/gradient_text.dart';

class ProjectBloc extends StatefulWidget {
  const ProjectBloc({super.key, required this.project});

  final Project project;

  @override
  State<ProjectBloc> createState() => _ProjectBlocState();
}

class _ProjectBlocState extends State<ProjectBloc> {
  bool _hovering = false;

  void _open() {
    Get.find<LinkAnalyticsService>().openLink(
      url: widget.project.link,
      linkType: LinkType.project,
      linkText: widget.project.name,
      additionalInfo: widget.project.tech.join(', '),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: _open,
        child: SizedBox(
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: AppColors.richBlack,
                  border: Border.all(
                    color: AppColors.lightPeriwinkle.withValues(alpha: _hovering ? 0.5 : 0.2),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.project.name,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, height: 1.3),
                          ).gradient(),
                        ),
                        const SizedBox(width: 12),
                        AnimatedSlide(
                          duration: const Duration(milliseconds: 200),
                          offset: _hovering ? const Offset(0.2, -0.2) : Offset.zero,
                          child: const Icon(
                            Icons.north_east_rounded,
                            color: AppColors.lightPeriwinkle,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.project.tech
                          .map(
                            (tech) => Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.lightPeriwinkle.withValues(alpha: 0.35)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                tech,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: AppColors.lightPeriwinkle,
                                  height: 1.2,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.project.description,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        height: 1.6,
                        color: AppColors.lightPeriwinkle.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Align(
                alignment: _hovering ? Alignment.centerLeft : Alignment.centerRight,
                child: AnimatedContainer(
                  height: 2,
                  width: _hovering ? 350 : 0,
                  decoration: const BoxDecoration(color: AppColors.lightPeriwinkle),
                  duration: const Duration(milliseconds: 300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
