import 'dart:ui';

enum Languages {
  turkish(languageCode: 'en', countryCode: 'US'),
  english(languageCode: 'tr', countryCode: 'TR');

  final String languageCode;
  final String? countryCode;

  const Languages({required this.languageCode, this.countryCode});

  Locale toLocale() => Locale(languageCode, countryCode);
}
