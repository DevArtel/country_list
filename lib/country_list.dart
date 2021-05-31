library country_list;

import 'package:country_list/src/country_code.dart';
import 'package:country_list/src/country_list_localizations.dart';
import 'package:flutter/cupertino.dart';

import 'src/data/country_codes.dart';

export 'src/country_code.dart';
export 'src/country_list_localizations.dart';

class CountryList {
  List<CountryCode> getCountries(BuildContext context) {
    final localizations = CountryListLocalizations.of(context);
    
    return codes.map((json) {
      final model = CountryCode.fromJson(json);
      return localizations.localize(model);
    }).toList();
  }
}
