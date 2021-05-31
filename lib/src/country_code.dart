import 'package:collection/collection.dart' show IterableExtension;
import 'package:country_list/src/country_list_localizations.dart';
import 'package:flutter/cupertino.dart';

import 'data/country_codes.dart';

/// Country model. This is the model that contains all the information
class CountryCode {
  /// Country name
  String name; // TODO

  /// the country code (IT,AF..)
  final String code;

  /// the dial code (+39,+93..)
  final String phonePrefix;

  CountryCode({
    required this.name,
    required this.code,
    required this.phonePrefix,
  });

  factory CountryCode.fromCountryCode(String countryCode) {
    final Map<String, String>? jsonCode = codes.firstWhereOrNull(
      (code) => code['code'] == countryCode,
    );
    return CountryCode.fromJson(jsonCode!);
  }

  factory CountryCode.fromDialCode(String dialCode) {
    final Map<String, String>? jsonCode = codes.firstWhereOrNull(
      (code) => code['dial_code'] == dialCode,
    );
    return CountryCode.fromJson(jsonCode!);
  }

  CountryCode localize(BuildContext context) {
    return this..name = CountryListLocalizations.of(context)?.translate(this.code) ?? this.name;
  }

  factory CountryCode.fromJson(Map<String, dynamic> json) {
    return CountryCode(
      name: json['name'],
      code: json['code'],
      phonePrefix: json['dial_code'],
    );
  }

  @override
  String toString() => "$phonePrefix";

  String toLongString() => "$phonePrefix ${toCountryStringOnly()}";

  String toCountryStringOnly() {
    return '$_cleanName';
  }

  String? get _cleanName {
    return name.replaceAll(RegExp(r'[[\]]'), '').split(',').first;
  }
}
