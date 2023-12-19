import 'dart:ui';

import 'package:dash_flags/dash_flags.dart';

extension LanguageExtensions on Language {
  Locale toLocale() => Locale.fromSubtags(
        languageCode: name.split('_').first,
        countryCode: name.split('_').lastOrNull?.toUpperCase(),
      );
}

extension IterableLanguageExtensions on Iterable<Language> {
  List<Locale> toLocale() => map((e) => e.toLocale()).toList();
}
