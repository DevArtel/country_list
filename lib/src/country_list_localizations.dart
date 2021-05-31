import 'dart:convert';

import 'package:country_list/country_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountryListLocalizations {
  final Locale locale;

  static const LocalizationsDelegate<CountryListLocalizations> delegate = _CountryLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  CountryListLocalizations(this.locale);

  static CountryListLocalizations of(BuildContext context) {
    return Localizations.of<CountryListLocalizations>(
      context,
      CountryListLocalizations,
    )!;
  }

  static CountryListLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<CountryListLocalizations>(
      context,
      CountryListLocalizations,
    );
  }

  Future<void> load() async {
    final jsonString = await rootBundle.loadString('packages/country_list/assets/i18n/${locale.languageCode}.json');
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

    _localizedStrings = jsonMap.map((key, dynamic value) {
      final name = value is List ? value.first.toString() : value.toString();
      return MapEntry(key, name);
    });
  }

  CountryCode localize(CountryCode model) {
    final localizedName = _localizedStrings[model.code];

    return CountryCode(
      name: localizedName ?? model.name,
      code: model.code,
      phonePrefix: model.phonePrefix,
    );
  }
}

class _CountryLocalizationsDelegate extends LocalizationsDelegate<CountryListLocalizations> {
  const _CountryLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return [
      "af",
      "am",
      "ar",
      "az",
      "be",
      "bg",
      "bn",
      "bs",
      "ca",
      "cs",
      "da",
      "de",
      "el",
      "en",
      "es",
      "et",
      "fa",
      "fi",
      "fr",
      "gl",
      "ha",
      "he",
      "hi",
      "hr",
      "hu",
      "hy",
      "id",
      "is",
      "it",
      "ja",
      "ka",
      "kk",
      "km",
      "ko",
      "ku",
      "ky",
      "lt",
      "lv",
      "mk",
      "ml",
      "mn",
      "ms",
      "nb",
      "nl",
      "nn",
      "no",
      "pl",
      "ps",
      "pt",
      "ro",
      "ru",
      "sd",
      "sk",
      "sl",
      "so",
      "sq",
      "sr",
      "sv",
      "ta",
      "tg",
      "th",
      "tk",
      "tr",
      "tt",
      "uk",
      "ug",
      "ur",
      "uz",
      "vi",
      "zh",
    ].contains(locale.languageCode);
  }

  @override
  Future<CountryListLocalizations> load(Locale locale) async {
    final localizations = CountryListLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_CountryLocalizationsDelegate old) => false;
}
