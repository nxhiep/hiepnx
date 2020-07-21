import 'package:flutter/material.dart';
import 'package:hiepnx/utils/configs.dart';
import 'package:hiepnx/utils/theme_utils.dart';

class ThemeModel extends ChangeNotifier {

  ThemeMode themeMode;
  ThemeModel({ this.themeMode });

  ThemeMode getThemeMode() {
    if(themeMode == null){
      return CONFIG_DARK_MODE ? ThemeMode.dark : ThemeMode.light;
    }
    return themeMode;
  }

  bool isDarkMode() {
    return getThemeMode() == ThemeMode.dark;
  }

  void setThemeMode(ThemeMode themeMode) async {
    this.themeMode = themeMode;
    await ThemeUtils.setThemeMode(themeMode);
    notifyListeners();
  }
} 