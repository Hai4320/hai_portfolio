/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 3
/// Strings: 102 (34 per locale)

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
	String get skill2 => 'Over a two years of experience building products for clients across Japan and Vietnam.';
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
	@override String get skill2 => '日本とベトナムのクライアント向けに製品を構築してきた2年以上の経験があります。';
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
	@override String get skill2 => 'Hơn hai năm kinh nghiệm xây dựng sản phẩm cho khách hàng tại Nhật Bản và Việt Nam.';
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
