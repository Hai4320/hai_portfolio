import 'package:flutter/material.dart';

class Skill {
  final String name;
  final String logoUrl;
  final Color logoColor;

  const Skill({required this.name, required this.logoUrl, required this.logoColor});
}

class SkillBadge extends StatelessWidget {
  const SkillBadge({super.key, required this.skill, this.isCompact = false});

  final Skill skill;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final height = isCompact ? 28.0 : 32.0;
    final fontSize = isCompact ? 12.0 : 14.0;
    final logoSize = isCompact ? 16.0 : 20.0;
    final horizontalPadding = isCompact ? 10.0 : 14.0;

    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(color: const Color(0xFF323330), borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            skill.logoUrl,
            width: logoSize,
            height: logoSize,
            color: skill.logoColor,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.code, size: logoSize, color: skill.logoColor),
          ),
          const SizedBox(width: 8),
          Text(
            skill.name,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key, this.isCompact = false});

  final bool isCompact;

  static const skills = [
    Skill(name: 'Android', logoUrl: 'https://cdn.simpleicons.org/android', logoColor: Color(0xFF34A853)),
    Skill(name: 'Kotlin', logoUrl: 'https://cdn.simpleicons.org/kotlin', logoColor: Color(0xFF7F52FF)),
    Skill(name: 'Flutter', logoUrl: 'https://cdn.simpleicons.org/flutter', logoColor: Color(0xFF02569B)),
    Skill(name: 'React Native', logoUrl: 'https://cdn.simpleicons.org/react', logoColor: Color(0xFF61DAFB)),
    Skill(name: 'Unity', logoUrl: 'https://cdn.simpleicons.org/unity', logoColor: Colors.white),
    Skill(name: 'JavaScript', logoUrl: 'https://cdn.simpleicons.org/javascript', logoColor: Color(0xFFF7DF1E)),
    Skill(name: 'Python', logoUrl: 'https://cdn.simpleicons.org/python', logoColor: Color(0xFFFFD43B)),
    Skill(name: 'Swift', logoUrl: 'https://cdn.simpleicons.org/swift', logoColor: Color(0xFFFA7343)),
    Skill(name: 'Git', logoUrl: 'https://cdn.simpleicons.org/git', logoColor: Color(0xFFF05033)),
  ];

  @override
  Widget build(BuildContext context) {
    final spacing = isCompact ? 8.0 : 12.0;
    final runSpacing = isCompact ? 8.0 : 12.0;

    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: skills.map((skill) => SkillBadge(skill: skill, isCompact: isCompact)).toList(),
    );
  }
}
