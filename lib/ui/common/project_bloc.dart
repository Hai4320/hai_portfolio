import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hai_portfolio/data/model/project.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';
import 'package:hai_portfolio/utils/gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectBloc extends StatefulWidget {
  const ProjectBloc({super.key, required this.project});

  final Project project;

  @override
  State<ProjectBloc> createState() => _ProjectBlocState();
}

class _ProjectBlocState extends State<ProjectBloc> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        child: SizedBox(
          width: 350,
          child: Column(
            children: [
              Container(
                width: 350,
                height: 250,
                padding: const EdgeInsets.all(40),
                decoration: const BoxDecoration(
                  color: AppColors.richBlack,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ).gradient(),
                    const SizedBox(height: 15),
                    Text(
                      widget.project.tech.join(' + '),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: AppColors.lightPeriwinkle,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      widget.project.description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: AppColors.lightPeriwinkle,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(widget.project.link), webOnlyWindowName: '_blank');
                      },
                      child: AnimatedScale(
                        scale: hovering ? 1.2 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.call_made,
                              color: AppColors.lightPeriwinkle,
                              size: 12,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "View",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: AppColors.lightPeriwinkle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: hovering ? Alignment.centerLeft : Alignment.centerRight,
                child: AnimatedContainer(
                  height: 2,
                  width: hovering ? 350 : 0,
                  decoration: const BoxDecoration(
                    color: AppColors.lightPeriwinkle,
                  ),
                  duration: const Duration(milliseconds: 300),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
