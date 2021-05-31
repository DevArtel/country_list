import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountryListLocalizations {
  final Locale locale;

  CountryListLocalizations(this.locale);

  static CountryListLocalizations? of(BuildContext context) {
    return Localizations.of<CountryListLocalizations>(
      context,
      CountryListLocalizations,
    );
  }

  static const LocalizationsDelegate<CountryListLocalizations> delegate = _CountryLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  Future<void> load() async {
    String jsonString = await rootBundle.loadString('packages/country_list/assets/i18n/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String? translate(String key) {
    return _localizedStrings[key];
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
    CountryListLocalizations localizations = new CountryListLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_CountryLocalizationsDelegate old) => false;
}
