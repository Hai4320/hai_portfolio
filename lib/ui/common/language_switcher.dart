import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/i18n/strings.g.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';
import 'package:hai_portfolio/utils/locale_controller.dart';

class LanguageSwitcherCompact extends StatelessWidget {
  const LanguageSwitcherCompact({super.key});

  @override
  Widget build(BuildContext context) {
    final localeController = Get.find<LocaleController>();

    return Obx(() {
      final currentLocale = localeController.currentLocale;
      return PopupMenuButton<AppLocale>(
        offset: const Offset(0, 40),
        color: AppColors.richBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: AppColors.lightPeriwinkle),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightPeriwinkle),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                localeController.getLanguageFlag(currentLocale),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 6),
              Text(
                localeController.getLanguageCode(currentLocale),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const Icon(Icons.arrow_drop_down, color: Colors.white, size: 18),
            ],
          ),
        ),
        itemBuilder: (context) => AppLocale.values.map((locale) {
          final isSelected = locale == currentLocale;
          return PopupMenuItem<AppLocale>(
            value: locale,
            child: Row(
              children: [
                Text(
                  localeController.getLanguageFlag(locale),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 10),
                Text(
                  localeController.getLanguageCode(locale),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? AppColors.lightPeriwinkle : Colors.white,
                  ),
                ),
                if (isSelected) ...[
                  const Spacer(),
                  const Icon(Icons.check, color: AppColors.lightPeriwinkle, size: 16),
                ],
              ],
            ),
          );
        }).toList(),
        onSelected: (AppLocale locale) {
          localeController.setLocale(locale);
        },
      );
    });
  }
}
