/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 3
/// Strings: 195 (65 per locale)

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ja(languageCode: 'ja', build: _StringsJa.build),
	vi(languageCode: 'vi', build: _StringsVi.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  );

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsImagesEn images = _StringsImagesEn._(_root);
	late final _StringsStringsEn strings = _StringsStringsEn._(_root);
}

// Path: images
class _StringsImagesEn {
	_StringsImagesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get avatar => 'assets/images/avatar.jpg';
	String get github => 'assets/images/github.svg';
	String get linkedin => 'assets/images/linkedin.svg';
	String get handLeft => 'assets/images/hand-left.png';
}

// Path: strings
class _StringsStringsEn {
	_StringsStringsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsStringsAppEn app = _StringsStringsAppEn._(_root);
	late final _StringsStringsHomeEn home = _StringsStringsHomeEn._(_root);
	late final _StringsStringsContactEn contact = _StringsStringsContactEn._(_root);
	late final _StringsStringsFooterEn footer = _StringsStringsFooterEn._(_root);
	late final _StringsStringsLinksEn links = _StringsStringsLinksEn._(_root);
	late final _StringsStringsAppsEn apps = _StringsStringsAppsEn._(_root);
}

// Path: strings.app
class _StringsStringsAppEn {
	_StringsStringsAppEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Hai.';
}

// Path: strings.home
class _StringsStringsHomeEn {
	_StringsStringsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Mobile\nDeveloper';
	String get subtitle => 'I like to craft innovative and scalable mobile products with great user experiences.';
	String get skill1 => 'Highly skilled at progressive enhancement, design systems & UI Engineering.';
	String get skill2 => 'Over a three years of experience building products for clients across Japan and Vietnam.';
	late final _StringsStringsHomeMobileEn mobile = _StringsStringsHomeMobileEn._(_root);
	late final _StringsStringsHomeEngineeringEn engineering = _StringsStringsHomeEngineeringEn._(_root);
	late final _StringsStringsHomeSkillsEn skills = _StringsStringsHomeSkillsEn._(_root);
	late final _StringsStringsHomeBuildEn build = _StringsStringsHomeBuildEn._(_root);
	late final _StringsStringsHomeSupportEn support = _StringsStringsHomeSupportEn._(_root);
	late final _StringsStringsHomeExperienceEn experience = _StringsStringsHomeExperienceEn._(_root);
	late final _StringsStringsHomeThankYouEn thankYou = _StringsStringsHomeThankYouEn._(_root);
}

// Path: strings.contact
class _StringsStringsContactEn {
	_StringsStringsContactEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'CONNECT ME';
	String get email => 'duchai4320@gmail.com';
	String get works => 'My Works';
	String get shelf => 'My Shelf';
	String get resume => 'My Résumé';
}

// Path: strings.footer
class _StringsStringsFooterEn {
	_StringsStringsFooterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get copyright => '© HAI 2026.';
}

// Path: strings.links
class _StringsStringsLinksEn {
	_StringsStringsLinksEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get email => 'mailto:duchai4320@gmail.com';
	String get github => 'https://github.com/Hai4320';
	String get linkedin => 'https://www.linkedin.com/in/hai4320';
}

// Path: strings.apps
class _StringsStringsAppsEn {
	_StringsStringsAppsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My Apps';
	String get subtitle => 'Explore the applications I\'ve built and published on major app stores.';
	String get allApps => 'All Apps';
	String get featuredApps => 'Featured Apps';
	String get seeMore => 'See All Apps';
	String get downloadButton => 'Download';
	String get termsOfUse => 'Terms of Use';
	String get features => 'Features';
	String get screenshots => 'Screenshots';
	late final _StringsStringsAppsAppMetadataEn appMetadata = _StringsStringsAppsAppMetadataEn._(_root);
	late final _StringsStringsAppsFiltersEn filters = _StringsStringsAppsFiltersEn._(_root);
	late final _StringsStringsAppsPlatformsEn platforms = _StringsStringsAppsPlatformsEn._(_root);
	late final _StringsStringsAppsHealthTrackerEn healthTracker = _StringsStringsAppsHealthTrackerEn._(_root);
	late final _StringsStringsAppsFoodDeliveryEn foodDelivery = _StringsStringsAppsFoodDeliveryEn._(_root);
	late final _StringsStringsAppsDramaStreamEn dramaStream = _StringsStringsAppsDramaStreamEn._(_root);
	late final _StringsStringsAppsSleepAnalyticsEn sleepAnalytics = _StringsStringsAppsSleepAnalyticsEn._(_root);
	late final _StringsStringsAppsPachinkoMasterEn pachinkoMaster = _StringsStringsAppsPachinkoMasterEn._(_root);
	late final _StringsStringsAppsRetailNavigatorEn retailNavigator = _StringsStringsAppsRetailNavigatorEn._(_root);
}

// Path: strings.home.mobile
class _StringsStringsHomeMobileEn {
	_StringsStringsHomeMobileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Mobile';
	String get description => 'I have the ideal tools for developing mobile applications, and I can definitely work without them to produce quick, durable solutions that are designed for growth – performance and scalability are top objectives on my radar.';
}

// Path: strings.home.engineering
class _StringsStringsHomeEngineeringEn {
	_StringsStringsHomeEngineeringEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Engineering';
	String get description => 'Besides mobile development, I also enjoy working on web projects, sometimes as a Frontend developer and occasionally as a Backend developer. Although I\'m not an expert in this field, I am very passionate about it.';
}

// Path: strings.home.skills
class _StringsStringsHomeSkillsEn {
	_StringsStringsHomeSkillsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My Skills';
}

// Path: strings.home.build
class _StringsStringsHomeBuildEn {
	_StringsStringsHomeBuildEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'I build &\ndesign stuff';
	String get description => 'Open source projects, mobile apps and experimentals.';
	String get button => 'See my apps';
}

// Path: strings.home.support
class _StringsStringsHomeSupportEn {
	_StringsStringsHomeSupportEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'I support,\nsometimes';
	String get description => 'Report issue & bug open source';
	String get button => 'Read My Article';
}

// Path: strings.home.experience
class _StringsStringsHomeExperienceEn {
	_StringsStringsHomeExperienceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Over the years,';
	String get emoji => '\n(~_^)\n';
	String get description => 'I build applications for both companies and personal projects, ranging from travel and food apps with a focus on user interface to AI applications for fitness and health with complex effects and logic, serving people all over Japan. Currently, I work at Sun* as a mobile engineer in the growth team.';
}

// Path: strings.home.thankYou
class _StringsStringsHomeThankYouEn {
	_StringsStringsHomeThankYouEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get message => 'Creating Mobile Solutions That Not Only Meet But Exceed Your Expectations.';
	String get title => 'Thank for your watching!';
}

// Path: strings.apps.appMetadata
class _StringsStringsAppsAppMetadataEn {
	_StringsStringsAppsAppMetadataEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get version => 'Version';
	String get size => 'Size';
	String get rating => 'Rating';
	String get downloads => 'Downloads';
	String get releaseDate => 'Released';
}

// Path: strings.apps.filters
class _StringsStringsAppsFiltersEn {
	_StringsStringsAppsFiltersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get all => 'All';
	String get featured => 'Featured';
}

// Path: strings.apps.platforms
class _StringsStringsAppsPlatformsEn {
	_StringsStringsAppsPlatformsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get playstore => 'Play Store';
	String get appstore => 'App Store';
	String get web => 'Web Version';
}

// Path: strings.apps.healthTracker
class _StringsStringsAppsHealthTrackerEn {
	_StringsStringsAppsHealthTrackerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Health Tracker';
	String get termsOfUse => 'Health Tracker Terms of Use and Privacy Policy\n\n1. Health Data\nThis app collects health data for tracking purposes. Your data is stored locally on your device unless you choose to sync with cloud services.\n\n2. User Agreement\nBy using this app, you agree to use it only for personal health tracking purposes.\n\n3. Liability\nThe app provides health insights for informational purposes only and should not be considered as medical advice.';
}

// Path: strings.apps.foodDelivery
class _StringsStringsAppsFoodDeliveryEn {
	_StringsStringsAppsFoodDeliveryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Food Delivery Pro';
	String get termsOfUse => 'Food Delivery Pro Terms of Service\n\n1. Service Description\nFood Delivery Pro connects customers with local food stores for delivery services.\n\n2. User Responsibilities\nUsers agree to provide accurate information and use the service legally and responsibly.\n\n3. Limitation of Liability\nWe are not responsible for food quality or delivery delays caused by third parties.';
}

// Path: strings.apps.dramaStream
class _StringsStringsAppsDramaStreamEn {
	_StringsStringsAppsDramaStreamEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Drama Stream';
	String get termsOfUse => 'Drama Stream Terms of Use\n\n1. Content License\nAll content in Drama Stream is licensed for personal, non-commercial use only.\n\n2. Restrictions\nYou may not reproduce, distribute, or transmit any content without permission.\n\n3. Account Termination\nWe reserve the right to terminate accounts violating these terms.';
}

// Path: strings.apps.sleepAnalytics
class _StringsStringsAppsSleepAnalyticsEn {
	_StringsStringsAppsSleepAnalyticsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Sleep Analytics';
	String get termsOfUse => 'Sleep Analytics Privacy Policy and Terms\n\n1. Data Privacy\nSleep data is stored securely and never shared with third parties without your consent.\n\n2. Health Information\nThis app is not a medical device and should not replace professional medical advice.\n\n3. User Consent\nBy using this app, you consent to data collection for improving the service.';
}

// Path: strings.apps.pachinkoMaster
class _StringsStringsAppsPachinkoMasterEn {
	_StringsStringsAppsPachinkoMasterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Pachinko Master';
	String get termsOfUse => 'Pachinko Master Terms of Service\n\n1. Game License\nThis game is provided for entertainment purposes only.\n\n2. In-App Purchases\nAll purchases are final and non-refundable except as required by law.\n\n3. Fair Play\nMultiplayer features must be used fairly. Cheating or exploiting bugs is prohibited.';
}

// Path: strings.apps.retailNavigator
class _StringsStringsAppsRetailNavigatorEn {
	_StringsStringsAppsRetailNavigatorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Retail Navigator';
	String get termsOfUse => 'Retail Navigator Terms and Privacy Policy\n\n1. Location Data\nThis app uses Bluetooth beacon technology to determine your location within stores. Location data is processed locally and not stored permanently.\n\n2. Store Partnership\nRetail Navigator works with partner stores. Terms vary by store.\n\n3. Accuracy Disclaimer\nLocation accuracy depends on beacon availability and environmental factors.';
}

// Path: <root>
class _StringsJa extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsJa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsJa _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsImagesJa images = _StringsImagesJa._(_root);
	@override late final _StringsStringsJa strings = _StringsStringsJa._(_root);
}

// Path: images
class _StringsImagesJa extends _StringsImagesEn {
	_StringsImagesJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get avatar => 'assets/images/avatar.jpg';
	@override String get github => 'assets/images/github.svg';
	@override String get linkedin => 'assets/images/linkedin.svg';
	@override String get handLeft => 'assets/images/hand-left.png';
}

// Path: strings
class _StringsStringsJa extends _StringsStringsEn {
	_StringsStringsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override late final _StringsStringsAppJa app = _StringsStringsAppJa._(_root);
	@override late final _StringsStringsHomeJa home = _StringsStringsHomeJa._(_root);
	@override late final _StringsStringsContactJa contact = _StringsStringsContactJa._(_root);
	@override late final _StringsStringsFooterJa footer = _StringsStringsFooterJa._(_root);
	@override late final _StringsStringsLinksJa links = _StringsStringsLinksJa._(_root);
	@override late final _StringsStringsAppsJa apps = _StringsStringsAppsJa._(_root);
}

// Path: strings.app
class _StringsStringsAppJa extends _StringsStringsAppEn {
	_StringsStringsAppJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get name => 'Hai.';
}

// Path: strings.home
class _StringsStringsHomeJa extends _StringsStringsHomeEn {
	_StringsStringsHomeJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'モバイル\n開発者';
	@override String get subtitle => '優れたユーザー体験を持つ革新的でスケーラブルなモバイル製品を作ることが好きです。';
	@override String get skill1 => 'プログレッシブエンハンスメント、デザインシステム、UIエンジニアリングに長けています。';
	@override String get skill2 => '日本とベトナムのクライアント向けに製品を構築してきた3年以上の経験があります。';
	@override late final _StringsStringsHomeMobileJa mobile = _StringsStringsHomeMobileJa._(_root);
	@override late final _StringsStringsHomeEngineeringJa engineering = _StringsStringsHomeEngineeringJa._(_root);
	@override late final _StringsStringsHomeSkillsJa skills = _StringsStringsHomeSkillsJa._(_root);
	@override late final _StringsStringsHomeBuildJa build = _StringsStringsHomeBuildJa._(_root);
	@override late final _StringsStringsHomeSupportJa support = _StringsStringsHomeSupportJa._(_root);
	@override late final _StringsStringsHomeExperienceJa experience = _StringsStringsHomeExperienceJa._(_root);
	@override late final _StringsStringsHomeThankYouJa thankYou = _StringsStringsHomeThankYouJa._(_root);
}

// Path: strings.contact
class _StringsStringsContactJa extends _StringsStringsContactEn {
	_StringsStringsContactJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'お問い合わせ';
	@override String get email => 'duchai4320@gmail.com';
	@override String get works => '私の作品';
	@override String get shelf => '私の本棚';
	@override String get resume => '履歴書';
}

// Path: strings.footer
class _StringsStringsFooterJa extends _StringsStringsFooterEn {
	_StringsStringsFooterJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get copyright => '© HAI 2026.';
}

// Path: strings.links
class _StringsStringsLinksJa extends _StringsStringsLinksEn {
	_StringsStringsLinksJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get email => 'mailto:duchai4320@gmail.com';
	@override String get github => 'https://github.com/Hai4320';
	@override String get linkedin => 'https://www.linkedin.com/in/hai4320';
}

// Path: strings.apps
class _StringsStringsAppsJa extends _StringsStringsAppsEn {
	_StringsStringsAppsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '私のアプリ';
	@override String get subtitle => '私が開発し、主要なアプリストアに公開したアプリケーションを探索してください。';
	@override String get allApps => 'すべてのアプリ';
	@override String get featuredApps => '注目のアプリ';
	@override String get seeMore => 'すべてのアプリを見る';
	@override String get downloadButton => 'ダウンロード';
	@override String get termsOfUse => '利用規約';
	@override String get features => '機能';
	@override String get screenshots => 'スクリーンショット';
	@override late final _StringsStringsAppsAppMetadataJa appMetadata = _StringsStringsAppsAppMetadataJa._(_root);
	@override late final _StringsStringsAppsFiltersJa filters = _StringsStringsAppsFiltersJa._(_root);
	@override late final _StringsStringsAppsPlatformsJa platforms = _StringsStringsAppsPlatformsJa._(_root);
	@override late final _StringsStringsAppsHealthTrackerJa healthTracker = _StringsStringsAppsHealthTrackerJa._(_root);
	@override late final _StringsStringsAppsFoodDeliveryJa foodDelivery = _StringsStringsAppsFoodDeliveryJa._(_root);
	@override late final _StringsStringsAppsDramaStreamJa dramaStream = _StringsStringsAppsDramaStreamJa._(_root);
	@override late final _StringsStringsAppsSleepAnalyticsJa sleepAnalytics = _StringsStringsAppsSleepAnalyticsJa._(_root);
	@override late final _StringsStringsAppsPachinkoMasterJa pachinkoMaster = _StringsStringsAppsPachinkoMasterJa._(_root);
	@override late final _StringsStringsAppsRetailNavigatorJa retailNavigator = _StringsStringsAppsRetailNavigatorJa._(_root);
}

// Path: strings.home.mobile
class _StringsStringsHomeMobileJa extends _StringsStringsHomeMobileEn {
	_StringsStringsHomeMobileJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'モバイル';
	@override String get description => 'モバイルアプリケーション開発に最適なツールを持っており、それらがなくても、成長を目指した迅速で耐久性のあるソリューションを確実に提供できます - パフォーマンスとスケーラビリティが私のレーダーの最優先事項です。';
}

// Path: strings.home.engineering
class _StringsStringsHomeEngineeringJa extends _StringsStringsHomeEngineeringEn {
	_StringsStringsHomeEngineeringJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'エンジニアリング';
	@override String get description => 'モバイル開発以外にも、Webプロジェクトに取り組むことも楽しんでいます。フロントエンド開発者として、時にはバックエンド開発者として。この分野の専門家ではありませんが、非常に情熱を持っています。';
}

// Path: strings.home.skills
class _StringsStringsHomeSkillsJa extends _StringsStringsHomeSkillsEn {
	_StringsStringsHomeSkillsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'スキル';
}

// Path: strings.home.build
class _StringsStringsHomeBuildJa extends _StringsStringsHomeBuildEn {
	_StringsStringsHomeBuildJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '私は作り、\nデザインする';
	@override String get description => 'オープンソースプロジェクト、モバイルアプリ、実験的なもの。';
	@override String get button => '私のアプリを見る';
}

// Path: strings.home.support
class _StringsStringsHomeSupportJa extends _StringsStringsHomeSupportEn {
	_StringsStringsHomeSupportJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '時々\nサポートする';
	@override String get description => 'オープンソースの問題とバグを報告';
	@override String get button => '私の記事を読む';
}

// Path: strings.home.experience
class _StringsStringsHomeExperienceJa extends _StringsStringsHomeExperienceEn {
	_StringsStringsHomeExperienceJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'これまでの年月、';
	@override String get emoji => '\n(~_^)\n';
	@override String get description => '私は企業向けと個人プロジェクトの両方でアプリケーションを構築してきました。ユーザーインターフェースに焦点を当てた旅行や食べ物のアプリから、複雑なエフェクトとロジックを持つフィットネスや健康向けのAIアプリケーションまで、日本全国の人々にサービスを提供しています。現在、Sun*でグロースチームのモバイルエンジニアとして働いています。';
}

// Path: strings.home.thankYou
class _StringsStringsHomeThankYouJa extends _StringsStringsHomeThankYouEn {
	_StringsStringsHomeThankYouJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get message => '期待を満たすだけでなく、それを超えるモバイルソリューションを作成します。';
	@override String get title => 'ご覧いただきありがとうございます！';
}

// Path: strings.apps.appMetadata
class _StringsStringsAppsAppMetadataJa extends _StringsStringsAppsAppMetadataEn {
	_StringsStringsAppsAppMetadataJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get version => 'バージョン';
	@override String get size => 'サイズ';
	@override String get rating => '評価';
	@override String get downloads => 'ダウンロード数';
	@override String get releaseDate => 'リリース日';
}

// Path: strings.apps.filters
class _StringsStringsAppsFiltersJa extends _StringsStringsAppsFiltersEn {
	_StringsStringsAppsFiltersJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get all => 'すべて';
	@override String get featured => '注目';
}

// Path: strings.apps.platforms
class _StringsStringsAppsPlatformsJa extends _StringsStringsAppsPlatformsEn {
	_StringsStringsAppsPlatformsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get playstore => 'Play ストア';
	@override String get appstore => 'App Store';
	@override String get web => 'Web版';
}

// Path: strings.apps.healthTracker
class _StringsStringsAppsHealthTrackerJa extends _StringsStringsAppsHealthTrackerEn {
	_StringsStringsAppsHealthTrackerJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get name => 'ヘルスケア トラッカー';
	@override String get termsOfUse => 'ヘルスケア トラッカー利用規約およびプライバシーポリシー\n\n1. ヘルスデータ\nこのアプリはトラッキング目的のためにヘルスデータを収集します。データはクラウド同期を選択しない限り、デバイスにローカルに保存されます。\n\n2. ユーザー契約\nこのアプリを使用することで、個人のヘルスケアトラッキング目的でのみ使用することに同意します。\n\n3. 責任制限\nこのアプリが提供するヘルスインサイトは情報提供目的であり、医学的アドバイスとして見なされるべきではありません。';
}

// Path: strings.apps.foodDelivery
class _StringsStringsAppsFoodDeliveryJa extends _StringsStringsAppsFoodDeliveryEn {
	_StringsStringsAppsFoodDeliveryJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get name => 'フードデリバリー プロ';
	@override String get termsOfUse => 'フードデリバリー プロ利用規約\n\n1. サービス説明\nフードデリバリー プロは顧客と地元の飲食店をデリバリーサービスで繋ぎます。\n\n2. ユーザー責任\nユーザーは正確な情報を提供し、合法的かつ責任を持ってサービスを使用することに同意します。\n\n3. 責任制限\n第三者が原因による食品品質やデリバリー遅延については責任を負いません。';
}

// Path: strings.apps.dramaStream
class _StringsStringsAppsDramaStreamJa extends _StringsStringsAppsDramaStreamEn {
	_StringsStringsAppsDramaStreamJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get name => 'ドラマ ストリーム';
	@override String get termsOfUse => 'ドラマ ストリーム利用規約\n\n1. コンテンツライセンス\nドラマ ストリーム内のすべてのコンテンツは、個人の非商業的使用のためにのみライセンスされています。\n\n2. 制限事項\n許可なくコンテンツを複製、配布、送信することはできません。\n\n3. アカウント終了\nこれらの規約に違反するアカウントを終了する権利を予約します。';
}

// Path: strings.apps.sleepAnalytics
class _StringsStringsAppsSleepAnalyticsJa extends _StringsStringsAppsSleepAnalyticsEn {
	_StringsStringsAppsSleepAnalyticsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get name => 'スリープ アナリティクス';
	@override String get termsOfUse => 'スリープ アナリティクス プライバシーポリシーと利用規約\n\n1. データプライバシー\n睡眠データは安全に保存され、同意なしに第三者と共有されることはありません。\n\n2. ヘルス情報\nこのアプリは医療機器ではなく、専門的な医学的アドバイスに代わるものではありません。\n\n3. ユーザー同意\nこのアプリを使用することで、サービスの改善のためのデータ収集に同意します。';
}

// Path: strings.apps.pachinkoMaster
class _StringsStringsAppsPachinkoMasterJa extends _StringsStringsAppsPachinkoMasterEn {
	_StringsStringsAppsPachinkoMasterJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get name => 'パチンコ マスター';
	@override String get termsOfUse => 'パチンコ マスター利用規約\n\n1. ゲームライセンス\nこのゲームはエンターテインメント目的でのみ提供されます。\n\n2. アプリ内購入\nすべての購入は最終的であり、法律で必要な場合を除き返金不可です。\n\n3. フェアプレイ\nマルチプレイヤー機能はフェアプレイで使用する必要があります。チーティングやバグ悪用は禁止されています。';
}

// Path: strings.apps.retailNavigator
class _StringsStringsAppsRetailNavigatorJa extends _StringsStringsAppsRetailNavigatorEn {
	_StringsStringsAppsRetailNavigatorJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get name => 'リテール ナビゲーター';
	@override String get termsOfUse => 'リテール ナビゲーター利用規約とプライバシーポリシー\n\n1. ロケーションデータ\nこのアプリはBluetoothビーコン技術を使用して店舗内での位置を特定します。位置データはローカルで処理され、永続的に保存されません。\n\n2. ストアパートナーシップ\nリテール ナビゲーターはパートナー店舗と連携しています。規約は店舗によって異なります。\n\n3. 精度免責事項\n位置精度はビーコンの利用可能性と環境要因に依存します。';
}

// Path: <root>
class _StringsVi extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsVi.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.vi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <vi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsVi _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsImagesVi images = _StringsImagesVi._(_root);
	@override late final _StringsStringsVi strings = _StringsStringsVi._(_root);
}

// Path: images
class _StringsImagesVi extends _StringsImagesEn {
	_StringsImagesVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get avatar => 'assets/images/avatar.jpg';
	@override String get github => 'assets/images/github.svg';
	@override String get linkedin => 'assets/images/linkedin.svg';
	@override String get handLeft => 'assets/images/hand-left.png';
}

// Path: strings
class _StringsStringsVi extends _StringsStringsEn {
	_StringsStringsVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override late final _StringsStringsAppVi app = _StringsStringsAppVi._(_root);
	@override late final _StringsStringsHomeVi home = _StringsStringsHomeVi._(_root);
	@override late final _StringsStringsContactVi contact = _StringsStringsContactVi._(_root);
	@override late final _StringsStringsFooterVi footer = _StringsStringsFooterVi._(_root);
	@override late final _StringsStringsLinksVi links = _StringsStringsLinksVi._(_root);
	@override late final _StringsStringsAppsVi apps = _StringsStringsAppsVi._(_root);
}

// Path: strings.app
class _StringsStringsAppVi extends _StringsStringsAppEn {
	_StringsStringsAppVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get name => 'Hai.';
}

// Path: strings.home
class _StringsStringsHomeVi extends _StringsStringsHomeEn {
	_StringsStringsHomeVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lập Trình Viên\nMobile';
	@override String get subtitle => 'Tôi thích tạo ra các sản phẩm mobile sáng tạo, có khả năng mở rộng với trải nghiệm người dùng tuyệt vời.';
	@override String get skill1 => 'Có kỹ năng cao trong progressive enhancement, design systems & UI Engineering.';
	@override String get skill2 => 'Hơn ba năm kinh nghiệm xây dựng sản phẩm cho khách hàng tại Nhật Bản và Việt Nam.';
	@override late final _StringsStringsHomeMobileVi mobile = _StringsStringsHomeMobileVi._(_root);
	@override late final _StringsStringsHomeEngineeringVi engineering = _StringsStringsHomeEngineeringVi._(_root);
	@override late final _StringsStringsHomeSkillsVi skills = _StringsStringsHomeSkillsVi._(_root);
	@override late final _StringsStringsHomeBuildVi build = _StringsStringsHomeBuildVi._(_root);
	@override late final _StringsStringsHomeSupportVi support = _StringsStringsHomeSupportVi._(_root);
	@override late final _StringsStringsHomeExperienceVi experience = _StringsStringsHomeExperienceVi._(_root);
	@override late final _StringsStringsHomeThankYouVi thankYou = _StringsStringsHomeThankYouVi._(_root);
}

// Path: strings.contact
class _StringsStringsContactVi extends _StringsStringsContactEn {
	_StringsStringsContactVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'LIÊN HỆ';
	@override String get email => 'duchai4320@gmail.com';
	@override String get works => 'Dự án của tôi';
	@override String get shelf => 'Kệ sách của tôi';
	@override String get resume => 'CV của tôi';
}

// Path: strings.footer
class _StringsStringsFooterVi extends _StringsStringsFooterEn {
	_StringsStringsFooterVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get copyright => '© HAI 2026.';
}

// Path: strings.links
class _StringsStringsLinksVi extends _StringsStringsLinksEn {
	_StringsStringsLinksVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get email => 'mailto:duchai4320@gmail.com';
	@override String get github => 'https://github.com/Hai4320';
	@override String get linkedin => 'https://www.linkedin.com/in/hai4320';
}

// Path: strings.apps
class _StringsStringsAppsVi extends _StringsStringsAppsEn {
	_StringsStringsAppsVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ứng Dụng Của Tôi';
	@override String get subtitle => 'Khám phá các ứng dụng mà tôi đã phát triển và xuất bản trên các cửa hàng ứng dụng chính.';
	@override String get allApps => 'Tất cả ứng dụng';
	@override String get featuredApps => 'Ứng dụng nổi bật';
	@override String get seeMore => 'Xem tất cả ứng dụng';
	@override String get downloadButton => 'Tải xuống';
	@override String get termsOfUse => 'Điều khoản sử dụng';
	@override String get features => 'Tính năng';
	@override String get screenshots => 'Ảnh chụp màn hình';
	@override late final _StringsStringsAppsAppMetadataVi appMetadata = _StringsStringsAppsAppMetadataVi._(_root);
	@override late final _StringsStringsAppsFiltersVi filters = _StringsStringsAppsFiltersVi._(_root);
	@override late final _StringsStringsAppsPlatformsVi platforms = _StringsStringsAppsPlatformsVi._(_root);
	@override late final _StringsStringsAppsHealthTrackerVi healthTracker = _StringsStringsAppsHealthTrackerVi._(_root);
	@override late final _StringsStringsAppsFoodDeliveryVi foodDelivery = _StringsStringsAppsFoodDeliveryVi._(_root);
	@override late final _StringsStringsAppsDramaStreamVi dramaStream = _StringsStringsAppsDramaStreamVi._(_root);
	@override late final _StringsStringsAppsSleepAnalyticsVi sleepAnalytics = _StringsStringsAppsSleepAnalyticsVi._(_root);
	@override late final _StringsStringsAppsPachinkoMasterVi pachinkoMaster = _StringsStringsAppsPachinkoMasterVi._(_root);
	@override late final _StringsStringsAppsRetailNavigatorVi retailNavigator = _StringsStringsAppsRetailNavigatorVi._(_root);
}

// Path: strings.home.mobile
class _StringsStringsHomeMobileVi extends _StringsStringsHomeMobileEn {
	_StringsStringsHomeMobileVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mobile';
	@override String get description => 'Tôi có những công cụ lý tưởng để phát triển ứng dụng mobile, và tôi hoàn toàn có thể làm việc mà không cần chúng để tạo ra các giải pháp nhanh chóng, bền vững được thiết kế cho sự phát triển – hiệu suất và khả năng mở rộng là mục tiêu hàng đầu trong radar của tôi.';
}

// Path: strings.home.engineering
class _StringsStringsHomeEngineeringVi extends _StringsStringsHomeEngineeringEn {
	_StringsStringsHomeEngineeringVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Engineering';
	@override String get description => 'Ngoài phát triển mobile, tôi cũng thích làm việc với các dự án web, đôi khi với vai trò Frontend developer và thỉnh thoảng là Backend developer. Mặc dù tôi không phải chuyên gia trong lĩnh vực này, nhưng tôi rất đam mê.';
}

// Path: strings.home.skills
class _StringsStringsHomeSkillsVi extends _StringsStringsHomeSkillsEn {
	_StringsStringsHomeSkillsVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kỹ Năng';
}

// Path: strings.home.build
class _StringsStringsHomeBuildVi extends _StringsStringsHomeBuildEn {
	_StringsStringsHomeBuildVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tôi xây dựng &\nthiết kế';
	@override String get description => 'Các dự án open source, ứng dụng mobile và thử nghiệm.';
	@override String get button => 'Xem ứng dụng của tôi';
}

// Path: strings.home.support
class _StringsStringsHomeSupportVi extends _StringsStringsHomeSupportEn {
	_StringsStringsHomeSupportVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tôi hỗ trợ,\nthỉnh thoảng';
	@override String get description => 'Báo cáo issue & bug open source';
	@override String get button => 'Đọc bài viết của tôi';
}

// Path: strings.home.experience
class _StringsStringsHomeExperienceVi extends _StringsStringsHomeExperienceEn {
	_StringsStringsHomeExperienceVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Qua nhiều năm,';
	@override String get emoji => '\n(~_^)\n';
	@override String get description => 'Tôi xây dựng ứng dụng cho cả công ty và dự án cá nhân, từ ứng dụng du lịch và ẩm thực tập trung vào giao diện người dùng đến các ứng dụng AI cho fitness và sức khỏe với các hiệu ứng và logic phức tạp, phục vụ người dùng khắp Nhật Bản. Hiện tại, tôi làm việc tại Sun* với vai trò mobile engineer trong growth team.';
}

// Path: strings.home.thankYou
class _StringsStringsHomeThankYouVi extends _StringsStringsHomeThankYouEn {
	_StringsStringsHomeThankYouVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get message => 'Tạo ra các giải pháp Mobile không chỉ đáp ứng mà còn vượt xa kỳ vọng của bạn.';
	@override String get title => 'Cảm ơn bạn đã xem!';
}

// Path: strings.apps.appMetadata
class _StringsStringsAppsAppMetadataVi extends _StringsStringsAppsAppMetadataEn {
	_StringsStringsAppsAppMetadataVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get version => 'Phiên bản';
	@override String get size => 'Kích thước';
	@override String get rating => 'Đánh giá';
	@override String get downloads => 'Lượt tải';
	@override String get releaseDate => 'Ngày phát hành';
}

// Path: strings.apps.filters
class _StringsStringsAppsFiltersVi extends _StringsStringsAppsFiltersEn {
	_StringsStringsAppsFiltersVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get all => 'Tất cả';
	@override String get featured => 'Nổi bật';
}

// Path: strings.apps.platforms
class _StringsStringsAppsPlatformsVi extends _StringsStringsAppsPlatformsEn {
	_StringsStringsAppsPlatformsVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get playstore => 'Play Store';
	@override String get appstore => 'App Store';
	@override String get web => 'Phiên bản web';
}

// Path: strings.apps.healthTracker
class _StringsStringsAppsHealthTrackerVi extends _StringsStringsAppsHealthTrackerEn {
	_StringsStringsAppsHealthTrackerVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get name => 'Trình theo dõi sức khỏe';
	@override String get termsOfUse => 'Điều khoản sử dụng và chính sách bảo mật của Trình theo dõi sức khỏe\n\n1. Dữ liệu sức khỏe\nỨng dụng này thu thập dữ liệu sức khỏe cho mục đích theo dõi. Dữ liệu của bạn được lưu trữ cục bộ trên thiết bị của bạn trừ khi bạn chọn đồng bộ hóa với các dịch vụ đám mây.\n\n2. Thỏa thuận người dùng\nBằng cách sử dụng ứng dụng này, bạn đồng ý sử dụng nó chỉ cho mục đích theo dõi sức khỏe cá nhân.\n\n3. Giới hạn trách nhiệm\nỨng dụng cung cấp thông tin sức khỏe chỉ cho mục đích thông tin và không nên được coi là lời khuyên y tế.';
}

// Path: strings.apps.foodDelivery
class _StringsStringsAppsFoodDeliveryVi extends _StringsStringsAppsFoodDeliveryEn {
	_StringsStringsAppsFoodDeliveryVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get name => 'Giao thức ăn Pro';
	@override String get termsOfUse => 'Điều khoản dịch vụ của Giao thức ăn Pro\n\n1. Mô tả dịch vụ\nGiao thức ăn Pro kết nối khách hàng với các nhà hàng địa phương để giao dịch vụ giao hàng.\n\n2. Trách nhiệm người dùng\nNguời dùng đồng ý cung cấp thông tin chính xác và sử dụng dịch vụ một cách hợp pháp và có trách nhiệm.\n\n3. Giới hạn trách nhiệm\nChúng tôi không chịu trách nhiệm về chất lượng thực phẩm hoặc sự chậm trễ giao hàng do bên thứ ba gây ra.';
}

// Path: strings.apps.dramaStream
class _StringsStringsAppsDramaStreamVi extends _StringsStringsAppsDramaStreamEn {
	_StringsStringsAppsDramaStreamVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get name => 'Phát trực tiếp Phim ngắn';
	@override String get termsOfUse => 'Điều khoản sử dụng Phát trực tiếp Phim ngắn\n\n1. Giấy phép nội dung\nTất cả nội dung trong Phát trực tiếp Phim ngắn được cấp phép chỉ cho mục đích sử dụng cá nhân, không thương mại.\n\n2. Hạn chế\nBạn không được phép sao chép, phân phối hoặc truyền tải bất kỳ nội dung nào mà không có sự cho phép.\n\n3. Chấm dứt tài khoản\nChúng tôi bảo lưu quyền chấm dứt các tài khoản vi phạm các điều khoản này.';
}

// Path: strings.apps.sleepAnalytics
class _StringsStringsAppsSleepAnalyticsVi extends _StringsStringsAppsSleepAnalyticsEn {
	_StringsStringsAppsSleepAnalyticsVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get name => 'Phân tích giấc ngủ';
	@override String get termsOfUse => 'Chính sách bảo mật và điều khoản của Phân tích giấc ngủ\n\n1. Bảo mật dữ liệu\nDữ liệu giấc ngủ được lưu trữ an toàn và không bao giờ được chia sẻ với các bên thứ ba mà không có sự đồng ý của bạn.\n\n2. Thông tin sức khỏe\nỨng dụng này không phải là một thiết bị y tế và không nên thay thế lời khuyên y tế chuyên nghiệp.\n\n3. Sự đồng ý của người dùng\nBằng cách sử dụng ứng dụng này, bạn đồng ý với việc thu thập dữ liệu để cải thiện dịch vụ.';
}

// Path: strings.apps.pachinkoMaster
class _StringsStringsAppsPachinkoMasterVi extends _StringsStringsAppsPachinkoMasterEn {
	_StringsStringsAppsPachinkoMasterVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get name => 'Pachinko Thạo thủ';
	@override String get termsOfUse => 'Điều khoản dịch vụ của Pachinko Thạo thủ\n\n1. Giấy phép trò chơi\nTrò chơi này được cung cấp chỉ cho mục đích giải trí.\n\n2. Mua hàng trong ứng dụng\nTất cả các giao dịch mua hàng là cuối cùng và không được hoàn lại ngoài trường hợp luật yêu cầu.\n\n3. Chơi công bằng\nCác tính năng multiplayer phải được sử dụng một cách công bằng. Gian lận hoặc khai thác lỗi bị cấm.';
}

// Path: strings.apps.retailNavigator
class _StringsStringsAppsRetailNavigatorVi extends _StringsStringsAppsRetailNavigatorEn {
	_StringsStringsAppsRetailNavigatorVi._(_StringsVi root) : this._root = root, super._(root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get name => 'Điều hướng bán lẻ';
	@override String get termsOfUse => 'Điều khoản và chính sách bảo mật của Điều hướng bán lẻ\n\n1. Dữ liệu vị trí\nỨng dụng này sử dụng công nghệ Bluetooth beacon để xác định vị trí của bạn trong các cửa hàng. Dữ liệu vị trí được xử lý cục bộ và không được lưu trữ vĩnh viễn.\n\n2. Quan hệ đối tác cửa hàng\nĐiều hướng bán lẻ hoạt động với các cửa hàng đối tác. Các điều khoản khác nhau tùy theo cửa hàng.\n\n3. Tuyên bố từ chối trách nhiệm về độ chính xác\nĐộ chính xác của vị trí phụ thuộc vào tính khả dụng của beacon và các yếu tố môi trường.';
}
