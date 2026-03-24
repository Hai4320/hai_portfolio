import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/i18n/strings.g.dart';
import 'package:hai_portfolio/ui/common/back_navigation_button.dart';
import 'package:hai_portfolio/ui/common/download_button.dart';
import 'package:hai_portfolio/ui/common/feature_badge.dart';
import 'package:hai_portfolio/ui/common/featured_badge.dart';
import 'package:hai_portfolio/ui/common/metadata_chip.dart';
import 'package:hai_portfolio/ui/common/screenshot_carousel.dart';
import 'package:hai_portfolio/ui/screens/app_detail/app_detail_controller.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';
import 'package:hai_portfolio/utils/format.dart';
import 'package:hai_portfolio/utils/gradient_text.dart';

class AppDetailPhone extends StatelessWidget {
  final AppDetailController controller;

  const AppDetailPhone({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final app = controller.app;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          // Back button
          BackNavigationButton(label: 'Back', onTap: () => Get.back(), compact: true),
          const SizedBox(height: 24),

          // ── Hero card ──────────────────────────────────────────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  const Color(0xff7F7FD5).withAlpha(30),
                  const Color(0xff86A8E7).withAlpha(15),
                  AppColors.richBlack,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App icon
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: AppColors.black1,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 20, offset: const Offset(0, 8)),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    app.iconPath,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        Center(child: Icon(Icons.apps, color: AppColors.lightPeriwinkle.withAlpha(128), size: 36)),
                  ),
                ),
                const SizedBox(height: 16),

                // App name
                Text(
                  app.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900, height: 1.2),
                ).gradient(),

                if (app.isFeatured) ...[const SizedBox(height: 10), const FeaturedBadge(compact: true)],
                const SizedBox(height: 18),

                // Metadata chips
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    MetadataChip(
                      icon: Icons.star_rounded,
                      iconColor: Colors.amber,
                      text: '${app.metadata.rating}',
                      compact: true,
                    ),
                    MetadataChip(icon: Icons.update_rounded, text: 'v${app.metadata.version}', compact: true),
                    MetadataChip(icon: Icons.sd_storage_rounded, text: app.metadata.size, compact: true),
                    MetadataChip(
                      icon: Icons.download_rounded,
                      text: '${formatDownloads(app.metadata.downloads)}+',
                      compact: true,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Download buttons
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: app.links
                      .map(
                        (link) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: AppColors.black1,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(40)),
                          ),
                          child: DownloadButton(link: link, appName: app.name),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ── About ──────────────────────────────────────────────────────────
          _SectionCard(
            children: [
              _SectionHeader(icon: Icons.info_outline_rounded, title: 'About'),
              const SizedBox(height: 12),
              Text(
                app.fullDescription,
                style: TextStyle(fontSize: 14, color: AppColors.lightPeriwinkle.withAlpha(179), height: 1.8),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // ── Screenshots ────────────────────────────────────────────────────
          if (app.screenshotPaths.isNotEmpty) ...[
            _SectionHeader(icon: Icons.photo_library_outlined, title: t.strings.apps.screenshots),
            const SizedBox(height: 14),
            LayoutBuilder(
              builder: (context, constraints) {
                return ScreenshotCarousel(screenshotPaths: app.screenshotPaths, height: constraints.maxWidth * 0.65);
              },
            ),
            const SizedBox(height: 16),
          ],

          // ── Features ───────────────────────────────────────────────────────
          if (app.features.isNotEmpty) ...[
            _SectionCard(
              children: [
                _SectionHeader(icon: Icons.auto_awesome_rounded, title: t.strings.apps.features),
                const SizedBox(height: 14),
                Wrap(spacing: 8, runSpacing: 8, children: app.features.map((f) => FeatureBadge(label: f)).toList()),
              ],
            ),
            const SizedBox(height: 16),
          ],

          // ── Terms of Use ───────────────────────────────────────────────────
          if (app.termsOfUse.isNotEmpty) _CollapsibleTermsOfUsePhone(termsOfUse: app.termsOfUse),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// ── Shared section helpers ────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final List<Widget> children;
  const _SectionCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.richBlack,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(26)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  const _SectionHeader({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.lightPeriwinkle.withAlpha(200), size: 17),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ],
    );
  }
}

// ── Collapsible Terms of Use ──────────────────────────────────────────────────

class _CollapsibleTermsOfUsePhone extends StatefulWidget {
  final String termsOfUse;
  const _CollapsibleTermsOfUsePhone({required this.termsOfUse});

  @override
  State<_CollapsibleTermsOfUsePhone> createState() => _CollapsibleTermsOfUsePhoneState();
}

class _CollapsibleTermsOfUsePhoneState extends State<_CollapsibleTermsOfUsePhone> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.richBlack,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(26)),
      ),
      child: Column(
        children: [
          // Header — always visible, clickable
          GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.description_outlined, color: AppColors.lightPeriwinkle, size: 17),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      t.strings.apps.termsOfUse,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(Icons.expand_more_rounded, color: AppColors.lightPeriwinkle, size: 20),
                  ),
                ],
              ),
            ),
          ),
          // Content
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                widget.termsOfUse,
                style: TextStyle(fontSize: 13, color: AppColors.lightPeriwinkle.withAlpha(179), height: 1.8),
              ),
            ),
            crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
