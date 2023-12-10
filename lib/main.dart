import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_template/feature/home/home_view.dart';
import 'package:flutter_base_template/product/core/application.dart';
import 'package:flutter_base_template/product/enum/language_enums.dart';
import 'package:flutter_base_template/product/extension/language_extension.dart';
import 'package:google_fonts/google_fonts.dart';

// https://colorhunt.co/palette/0926351b42425c83749ec8b9
// colourcontrast: https://colourcontrast.cc/092635/9ec8b9

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Project related initializations
  await Application.ensureInitialized();

  runApp(
    EasyLocalization(
      path: ApplicationPath.languages.path,
      startLocale: Application.language.toLocale(),
      fallbackLocale: Languages.english.toLocale(),
      supportedLocales: Application.supportedLanguages.toLocale(),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.openSansTextTheme(),
        appBarTheme: AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
      navigatorKey: Application.navigation,
      scaffoldMessengerKey: Application.messenger,
      home: HomeView(),
    );
  }
}
