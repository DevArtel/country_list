library country_list;

import 'package:collection/collection.dart' show IterableExtension;
import 'package:country_list/src/country_code.dart';
import 'package:country_list/src/country_list_localizations.dart';
import 'package:flutter/cupertino.dart';

import 'src/data/country_codes.dart';

export 'src/country_code.dart';
export 'src/country_list_localizations.dart';

class CountryListManager {
  static final CountryListManager _instance = CountryListManager._internal();

  factory CountryListManager() => _instance;

  CountryListManager._internal();

  static List<CountryCode> getLocalizedCountries(BuildContext context) {
    final localizations = CountryListLocalizations.of(context);

    return codes.map((json) {
      final model = CountryCode.fromJson(json);
      return localizations.localize(model);
    }).toList();
  }

  static List<CountryCode> getCountries() {
    return codes.map((json) => CountryCode.fromJson(json)).toList();
  }

  static CountryCode? getCountryFromCode(String countryCode) {
    final jsonCode = codes.firstWhereOrNull((code) => code['code'] == countryCode);

    if (jsonCode == null) {
      return null;
    }
    return CountryCode.fromJson(jsonCode);
  }
}
