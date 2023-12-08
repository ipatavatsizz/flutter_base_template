import 'package:flutter/material.dart';
import 'package:flutter_base_template/product/enum/language_enums.dart';

class Application {
  static const Languages language = Languages.turkish;

  static const List<Languages> supportedLanguages = Languages.values;

  static final GlobalKey<NavigatorState> navigation =
      GlobalKey<NavigatorState>();

  static final GlobalKey<ScaffoldMessengerState> messenger =
      GlobalKey<ScaffoldMessengerState>();
}

enum ApplicationPath {
  assets(path: 'assets'),
  languages(path: 'assets/languages');

  final String path;
  const ApplicationPath({required this.path});
}
