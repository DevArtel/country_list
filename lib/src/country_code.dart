class CountryCode {
  /// Country name
  final String name;

  /// the country code (IT,AF..)
  final String code;

  /// the dial code (+39,+93..)
  final String phonePrefix;

  /// Locale of current model name localization
  final String? localeCode;

  CountryCode({
    required this.name,
    required this.code,
    required this.phonePrefix,
    this.localeCode,
  });

  factory CountryCode.fromJson(Map<String, dynamic> json) {
    return CountryCode(
      name: json['name'] as String,
      code: json['code'] as String,
      phonePrefix: json['dial_code'] as String,
    );
  }
}
