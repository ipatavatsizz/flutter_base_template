import 'dart:ui';

enum Languages {
  turkish(languageCode: 'tr', countryCode: 'TR'),
  english(languageCode: 'en', countryCode: 'US');

  final String languageCode;
  final String? countryCode;

  const Languages({required this.languageCode, this.countryCode});

  Locale toLocale() => Locale(languageCode, countryCode);
}
