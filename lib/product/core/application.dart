import 'package:dash_flags/dash_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Base class for application related settings
class Application {
  static const Language language = Language.tr;
  static const Language fallbackLanguage = Language.en;

  static const List<Language> supportedLanguages = [
    Language.en,
    Language.tr,
  ];

  static final GlobalKey<NavigatorState> navigation =
      GlobalKey<NavigatorState>();

  static final GlobalKey<ScaffoldMessengerState> messenger =
      GlobalKey<ScaffoldMessengerState>();

  static PackageInfo? package;

  static Future<void> ensureInitialized() async {
    /// Initialize EasyLocation package
    await EasyLocalization.ensureInitialized();

    /// Set preferred app orientations portrait
    /// Use `SystemChrome.restoreSystemUIOverlays` in case of device orientation issues
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    /// Close keyboard in case of restart and bugs
    /// Use in case of device keyboard issues (Alternative: FocusManager)
    await SystemChannels.textInput.invokeMethod('TextInput.hide');

    /// Initialize PackageInfo package based on the current platform
    package = await PackageInfo.fromPlatform();

    /// Related with GoogleFonts -for more information refer to link below
    /// https://pub.dev/packages/google_fonts#licensing-fonts
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
  }
}

/// Path class that holds application path variables
enum ApplicationPath {
  assets(path: 'assets'),
  languages(path: 'assets/languages');

  final String path;
  const ApplicationPath({required this.path});
}
