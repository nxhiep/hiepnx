
import 'package:flutter/material.dart';
import 'package:hiepnx/utils/configs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeUtils {
  static ThemeData lightTheme() {
    ThemeData lightData = ThemeData.light();
    return lightData.copyWith(
      tabBarTheme: TabBarTheme(
        labelColor: lightData.primaryColor
      )
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark();
  }

  static final String _themeModeKey = "@theme-mode-key";
  
  static SharedPreferences _prefs;
  static Future<SharedPreferences> getPrefs() async{
    if(_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    return _prefs;
  }

  static Future<ThemeMode> loadThemeMode() async {
    SharedPreferences sharedPreferences = await getPrefs();
    if(ThemeMode.dark.index == sharedPreferences.get(_themeModeKey)){
      return ThemeMode.dark;
    }
    if(ThemeMode.light.index == sharedPreferences.get(_themeModeKey)){
      return ThemeMode.light;
    }
    return CONFIG_DARK_MODE ? ThemeMode.dark : ThemeMode.light;
  }

  static Future<void> setThemeMode(ThemeMode _themeMode) async {
    SharedPreferences sharedPreferences = await getPrefs();
    await sharedPreferences.setInt(_themeModeKey, _themeMode.index);
  }
}