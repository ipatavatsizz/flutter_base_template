import 'dart:ui';

import 'package:flutter_base_template/product/enum/language_enums.dart';

extension IterableLanguageExtensions on Iterable<Languages> {
  List<Locale> toLocale() => map((e) => e.toLocale()).toList();
}
