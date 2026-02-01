import 'package:get/get.dart';
import 'package:hai_portfolio/i18n/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleController extends GetxController {
  static const String _localeKey = 'selected_locale';

  final Rx<AppLocale> _currentLocale = AppLocale.en.obs;

  AppLocale get currentLocale => _currentLocale.value;

  @override
  void onInit() {
    super.onInit();
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString(_localeKey);

    if (savedLocale != null) {
      final locale = AppLocale.values.firstWhere((l) => l.languageCode == savedLocale, orElse: () => AppLocale.en);
      await setLocale(locale);
    } else {
      // Use device locale if no saved preference
      final deviceLocale = LocaleSettings.useDeviceLocale();
      _currentLocale.value = deviceLocale;
    }
  }

  Future<void> setLocale(AppLocale locale) async {
    LocaleSettings.setLocale(locale);
    _currentLocale.value = locale;

    // Save preference
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
  }

  String getLanguageFlag(AppLocale locale) {
    switch (locale) {
      case AppLocale.en:
        return '🇺🇸';
      case AppLocale.ja:
        return '🇯🇵';
      case AppLocale.vi:
        return '🇻🇳';
    }
  }

  String getLanguageCode(AppLocale locale) {
    switch (locale) {
      case AppLocale.en:
        return 'EN';
      case AppLocale.ja:
        return 'JA';
      case AppLocale.vi:
        return 'VI';
    }
  }
}
