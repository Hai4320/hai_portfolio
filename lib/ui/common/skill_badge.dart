import 'package:flutter/material.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';

class Skill {
  final String name;
  final String logoUrl;
  final Color logoColor;

  /// 1-5. Fills the proficiency dots; 5 = expert, 3 = familiar, 1 = beginner.
  final int proficiency;

  const Skill({
    required this.name,
    required this.logoUrl,
    required this.logoColor,
    required this.proficiency,
  }) : assert(proficiency >= 1 && proficiency <= 5);
}

class SkillGroup {
  final String title;
  final List<Skill> skills;

  const SkillGroup({required this.title, required this.skills});
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key, this.isCompact = false});

  final bool isCompact;

  static const _groups = [
    SkillGroup(
      title: 'Mobile & Frameworks',
      skills: [
        Skill(name: 'Android', logoUrl: 'https://cdn.simpleicons.org/android', logoColor: Color(0xFF34A853), proficiency: 5),
        Skill(name: 'Flutter', logoUrl: 'https://cdn.simpleicons.org/flutter', logoColor: Color(0xFF02569B), proficiency: 5),
        Skill(name: 'Jetpack Compose', logoUrl: 'https://cdn.simpleicons.org/jetpackcompose', logoColor: Color(0xFF4285F4), proficiency: 4),
        Skill(name: 'Kotlin Multiplatform', logoUrl: 'https://cdn.simpleicons.org/kotlin', logoColor: Color(0xFF7F52FF), proficiency: 4),
        Skill(name: 'Unity', logoUrl: 'https://cdn.simpleicons.org/unity', logoColor: Colors.white, proficiency: 3),
        Skill(name: 'React Native', logoUrl: 'https://cdn.simpleicons.org/react', logoColor: Color(0xFF61DAFB), proficiency: 3),
      ],
    ),
    SkillGroup(
      title: 'Languages',
      skills: [
        Skill(name: 'Kotlin', logoUrl: 'https://cdn.simpleicons.org/kotlin', logoColor: Color(0xFF7F52FF), proficiency: 5),
        Skill(name: 'Dart', logoUrl: 'https://cdn.simpleicons.org/dart', logoColor: Color(0xFF0175C2), proficiency: 5),
        Skill(name: 'Swift', logoUrl: 'https://cdn.simpleicons.org/swift', logoColor: Color(0xFFFA7343), proficiency: 3),
        Skill(name: 'Python', logoUrl: 'https://cdn.simpleicons.org/python', logoColor: Color(0xFFFFD43B), proficiency: 3),
        Skill(name: 'JavaScript', logoUrl: 'https://cdn.simpleicons.org/javascript', logoColor: Color(0xFFF7DF1E), proficiency: 3),
      ],
    ),
    SkillGroup(
      title: 'Tools & Cloud',
      skills: [
        Skill(name: 'Git', logoUrl: 'https://cdn.simpleicons.org/git', logoColor: Color(0xFFF05033), proficiency: 5),
        Skill(name: 'Firebase', logoUrl: 'https://cdn.simpleicons.org/firebase', logoColor: Color(0xFFFFCA28), proficiency: 4),
        Skill(name: 'Node.js', logoUrl: 'https://cdn.simpleicons.org/nodedotjs', logoColor: Color(0xFF339933), proficiency: 3),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (isCompact) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < _groups.length; i++) ...[
            if (i > 0) const SizedBox(height: 24),
            _SkillGroupView(group: _groups[i], isCompact: true),
          ],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < _groups.length; i++) ...[
          if (i > 0) const SizedBox(width: 48),
          Expanded(child: _SkillGroupView(group: _groups[i], isCompact: false)),
        ],
      ],
    );
  }
}

class _SkillGroupView extends StatelessWidget {
  final SkillGroup group;
  final bool isCompact;

  const _SkillGroupView({required this.group, required this.isCompact});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          group.title.toUpperCase(),
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.8,
            color: AppColors.lightPeriwinkle.withValues(alpha: 0.75),
          ),
        ),
        const SizedBox(height: 12),
        Container(height: 1, color: AppColors.lightPeriwinkle.withValues(alpha: 0.2)),
        const SizedBox(height: 16),
        ...group.skills.map(
          (skill) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: _SkillRow(skill: skill, isCompact: isCompact),
          ),
        ),
      ],
    );
  }
}

class _SkillRow extends StatefulWidget {
  final Skill skill;
  final bool isCompact;

  const _SkillRow({required this.skill, required this.isCompact});

  @override
  State<_SkillRow> createState() => _SkillRowState();
}

class _SkillRowState extends State<_SkillRow> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final logoSize = widget.isCompact ? 16.0 : 18.0;
    final fontSize = widget.isCompact ? 13.0 : 14.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedSlide(
        offset: _hovering ? const Offset(0.01, 0) : Offset.zero,
        duration: const Duration(milliseconds: 200),
        child: Row(
          children: [
            Image.network(
              widget.skill.logoUrl,
              width: logoSize,
              height: logoSize,
              color: widget.skill.logoColor,
              errorBuilder: (_, _, _) => Icon(Icons.code, size: logoSize, color: widget.skill.logoColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.skill.name,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  color: _hovering ? Colors.white : AppColors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            _ProficiencyDots(level: widget.skill.proficiency),
          ],
        ),
      ),
    );
  }
}

class _ProficiencyDots extends StatelessWidget {
  final int level;

  const _ProficiencyDots({required this.level});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (i) => Padding(
          padding: EdgeInsets.only(left: i == 0 ? 0 : 5),
          child: Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: i < level ? AppColors.lightPeriwinkle : AppColors.lightPeriwinkle.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
