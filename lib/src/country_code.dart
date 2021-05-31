import 'package:collection/collection.dart' show IterableExtension;

import 'data/country_codes.dart';

class CountryCode {
  /// Country name
  final String name;

  /// the country code (IT,AF..)
  final String code;

  /// the dial code (+39,+93..)
  final String phonePrefix;

  CountryCode({
    required this.name,
    required this.code,
    required this.phonePrefix,
  });

  static CountryCode? fromCountryCode(String countryCode) {
    final jsonCode = codes.firstWhereOrNull((code) => code['code'] == countryCode);

    if (jsonCode == null) {
      return null;
    }
    return CountryCode.fromJson(jsonCode);
  }

  static CountryCode? fromDialCode(String phonePrefix) {
    final jsonCode = codes.firstWhereOrNull((code) => code['dial_code'] == phonePrefix);

    if (jsonCode == null) {
      return null;
    }

    return CountryCode.fromJson(jsonCode);
  }

  factory CountryCode.fromJson(Map<String, dynamic> json) {
    return CountryCode(
      name: json['name'] as String,
      code: json['code'] as String,
      phonePrefix: json['dial_code'] as String,
    );
  }
}
