import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hiepnx/generated/codegen_loader.g.dart';
import 'package:hiepnx/models/card.dart';
import 'package:hiepnx/provider/theme_model.dart';
import 'package:hiepnx/repositories/sql_repository.dart';
import 'package:hiepnx/screens/splash_screen.dart';
import 'package:hiepnx/utils/language_utils.dart';
import 'package:hiepnx/utils/theme_utils.dart';
import 'package:provider/provider.dart';

import 'generated/locale_keys.g.dart';

SqfliteRepository _sqlRepo = new SqfliteRepository();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _sqlRepo.initDb();
  ThemeMode themeMode = await ThemeUtils.loadThemeMode();
  runApp(SetupLocalization(
    child: MyApp(
      themeMode: themeMode
    ),
  ));
}

class MyApp extends StatelessWidget {

  final ThemeMode themeMode;
  MyApp({ this.themeMode });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeModel(themeMode: themeMode)),
      ],
      child: Consumer<ThemeModel>(
        builder: (_, ThemeModel themeModel, child) {
          return MaterialApp(
            title: LocaleKeys.title.tr(),
            theme: ThemeUtils.lightTheme(),
            darkTheme: ThemeUtils.darkTheme(),
            themeMode: themeModel.getThemeMode(),
            home: SplashScreen(),

            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        },
      ),
    );
  }
}

class SetupLocalization extends StatelessWidget {

  final Widget child;
  SetupLocalization({ this.child });

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      child: child, 
      supportedLocales: LanguageUtils.locales,
      path: 'assets/translations',
      fallbackLocale: LanguageUtils.currentLocale,
      assetLoader: CodegenLoader() // CsvAssetLoader()
    );
  }
}