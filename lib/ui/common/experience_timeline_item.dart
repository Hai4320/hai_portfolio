import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hai_portfolio/data/model/project.dart';
import 'package:hai_portfolio/data/model/timeline_entry.dart';
import 'package:hai_portfolio/i18n/strings.g.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';
import 'package:hai_portfolio/utils/tenure.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ExperienceTimelineItem extends StatefulWidget {
  final TimelineEntry entry;
  final bool isLast;
  final bool isCompact;

  const ExperienceTimelineItem({super.key, required this.entry, this.isLast = false, this.isCompact = false});

  @override
  State<ExperienceTimelineItem> createState() => _ExperienceTimelineItemState();
}

class _ExperienceTimelineItemState extends State<ExperienceTimelineItem> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    final entry = widget.entry;
    final now = DateTime.now();
    final periodText = _formatPeriod(entry).toUpperCase();
    final tenureText = _formatTenure(entry.tenure(now));
    final kindLabel = entry.kind == TimelineEntryKind.work
        ? t.strings.home.experience.workLabel
        : t.strings.home.experience.educationLabel;

    return VisibilityDetector(
      key: ValueKey('entry-${entry.subtitle}-${entry.title}-${entry.startDate.millisecondsSinceEpoch}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.15 && !_visible && mounted) {
          setState(() => _visible = true);
        }
      },
      child: AnimatedOpacity(
        opacity: _visible ? 1 : 0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOut,
        child: AnimatedSlide(
          offset: _visible ? Offset.zero : const Offset(0, 0.05),
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: widget.isCompact ? 20 : 36.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.isCompact
                    ? _buildCompact(entry, periodText, tenureText, kindLabel)
                    : _buildWide(entry, periodText, tenureText, kindLabel),
                if (!widget.isLast) ...[
                  SizedBox(height: widget.isCompact ? 20 : 36.h),
                  Container(height: 1, color: AppColors.lightPeriwinkle.withValues(alpha: 0.18)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWide(TimelineEntry entry, String periodText, String tenureText, String kindLabel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 220.w,
          child: _LeftMeta(
            kind: entry.kind,
            kindLabel: kindLabel,
            periodText: periodText,
            tenureText: tenureText,
            techStack: entry.techStack,
          ),
        ),
        SizedBox(width: 40.w),
        Expanded(child: _RightContent(entry: entry)),
      ],
    );
  }

  Widget _buildCompact(TimelineEntry entry, String periodText, String tenureText, String kindLabel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _KindBadge(label: kindLabel, kind: entry.kind),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                '$periodText  ·  $tenureText',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.4,
                  color: AppColors.lightPeriwinkle.withValues(alpha: 0.85),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        _RightContent(entry: entry, isCompact: true),
        if (entry.techStack.isNotEmpty) ...[
          const SizedBox(height: 16),
          _TechChips(techStack: entry.techStack, isCompact: true),
        ],
      ],
    );
  }

  static const _monthShort = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  String _formatPeriod(TimelineEntry entry) {
    final present = t.strings.home.experience.present;
    final start = entry.startDate;
    final end = entry.endDate;
    final startStr = '${_monthShort[start.month - 1]} ${start.year}';
    final endStr = end == null ? present : '${_monthShort[end.month - 1]} ${end.year}';
    return '$startStr — $endStr';
  }

  String _formatTenure(Tenure tenure) {
    if (tenure.years == 0 && tenure.months == 0) return '< 1 mo';
    final parts = <String>[];
    if (tenure.years > 0) parts.add('${tenure.years} ${tenure.years == 1 ? 'yr' : 'yrs'}');
    if (tenure.months > 0) parts.add('${tenure.months} ${tenure.months == 1 ? 'mo' : 'mos'}');
    return parts.join(' ');
  }
}

class _LeftMeta extends StatelessWidget {
  final TimelineEntryKind kind;
  final String kindLabel;
  final String periodText;
  final String tenureText;
  final List<String> techStack;

  const _LeftMeta({
    required this.kind,
    required this.kindLabel,
    required this.periodText,
    required this.tenureText,
    required this.techStack,
  });

  @override
  Widget build(BuildContext context) {
    final chipsHeaderLabel = kind == TimelineEntryKind.work
        ? t.strings.home.experience.techStackLabel
        : t.strings.home.experience.skillsLabel;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _KindBadge(label: kindLabel, kind: kind),
        const SizedBox(height: 14),
        Text(
          periodText,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.6,
            color: AppColors.lightPeriwinkle,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          tenureText,
          style: TextStyle(fontSize: 13, color: AppColors.lightPeriwinkle.withValues(alpha: 0.6)),
        ),
        if (techStack.isNotEmpty) ...[
          const SizedBox(height: 20),
          Text(
            chipsHeaderLabel.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.4,
              color: AppColors.lightPeriwinkle.withValues(alpha: 0.55),
            ),
          ),
          const SizedBox(height: 10),
          _TechChips(techStack: techStack, isCompact: false),
        ],
      ],
    );
  }
}

class _RightContent extends StatelessWidget {
  final TimelineEntry entry;
  final bool isCompact;

  const _RightContent({required this.entry, this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    final titleSize = isCompact ? 20.0 : 26.0;
    final subtitleParts = [
      entry.subtitle,
      if (entry.location != null) entry.location!,
      if (entry.grade != null) '${t.strings.home.experience.gradeLabel} ${entry.grade!}',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          entry.title.toUpperCase(),
          style: TextStyle(
            fontSize: titleSize,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            height: 1.2,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitleParts.join('  ·  '),
          style: TextStyle(
            fontSize: isCompact ? 13 : 14,
            color: AppColors.lightPeriwinkle,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (entry.description != null) ...[
          SizedBox(height: isCompact ? 14 : 18),
          Text(
            entry.description!,
            style: TextStyle(fontSize: isCompact ? 13 : 14.5, height: 1.7, color: AppColors.white),
          ),
        ],
        if (entry.achievements.isNotEmpty) ...[
          SizedBox(height: isCompact ? 16 : 20),
          _SubsectionHeader(label: t.strings.home.experience.achievementsLabel),
          const SizedBox(height: 10),
          ...entry.achievements.map((a) => _BulletText(text: a, isCompact: isCompact)),
        ],
        if (entry.projects.isNotEmpty) ...[
          SizedBox(height: isCompact ? 18 : 22),
          _SubsectionHeader(label: t.strings.home.experience.projectsLabel),
          const SizedBox(height: 12),
          ...entry.projects.map((p) => _ProjectListItem(project: p, isCompact: isCompact)),
        ],
      ],
    );
  }
}

class _SubsectionHeader extends StatelessWidget {
  final String label;

  const _SubsectionHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.4,
        color: AppColors.lightPeriwinkle.withValues(alpha: 0.7),
      ),
    );
  }
}

class _BulletText extends StatelessWidget {
  final String text;
  final bool isCompact;

  const _BulletText({required this.text, required this.isCompact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: isCompact ? 7 : 8),
            child: Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(color: AppColors.lightPeriwinkle, shape: BoxShape.circle),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: isCompact ? 13 : 14, height: 1.65, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectListItem extends StatelessWidget {
  final Project project;
  final bool isCompact;

  const _ProjectListItem({required this.project, required this.isCompact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            runSpacing: 6,
            children: [
              Text(
                project.name,
                style: TextStyle(
                  fontSize: isCompact ? 14 : 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.3,
                ),
              ),
              ...project.tech.map(
                (t) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightPeriwinkle.withValues(alpha: 0.3)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    t,
                    style: TextStyle(
                      fontSize: 10.5,
                      color: AppColors.lightPeriwinkle.withValues(alpha: 0.9),
                      height: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            project.description,
            style: TextStyle(
              fontSize: isCompact ? 12.5 : 13.5,
              height: 1.6,
              color: AppColors.white.withValues(alpha: 0.85),
            ),
          ),
        ],
      ),
    );
  }
}

class _KindBadge extends StatelessWidget {
  final String label;
  final TimelineEntryKind kind;

  const _KindBadge({required this.label, required this.kind});

  @override
  Widget build(BuildContext context) {
    final isWork = kind == TimelineEntryKind.work;
    final accent = isWork ? AppColors.lightPeriwinkle : const Color(0xffffd700);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: accent.withValues(alpha: 0.6)),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.6,
          color: accent,
          height: 1.0,
        ),
      ),
    );
  }
}

class _TechChips extends StatelessWidget {
  final List<String> techStack;
  final bool isCompact;

  const _TechChips({required this.techStack, required this.isCompact});

  @override
  Widget build(BuildContext context) {
    if (techStack.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: techStack
          .map(
            (tech) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightPeriwinkle.withValues(alpha: 0.35)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tech,
                style: TextStyle(fontSize: isCompact ? 11 : 12, color: AppColors.lightPeriwinkle, height: 1.2),
              ),
            ),
          )
          .toList(),
    );
  }
}
