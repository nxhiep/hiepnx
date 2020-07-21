import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hiepnx/generated/locale_keys.g.dart';
import 'package:hiepnx/provider/theme_model.dart';
import 'package:hiepnx/utils/language_utils.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _makeSettingDarkModeItem(),
          _makeSettingLanguageItem()
        ],
      ),
    );
  }

  Widget _makeSettingLanguageItem() {
    List<DropdownMenuItem<String>> widgets = [];
    LanguageUtils.mapLocaleName.forEach((String key, String name) {
      widgets.add(DropdownMenuItem<String>(
        value: key,
        child: Text(name.tr())
      ));
    });
    return ListTile(
      leading: Icon(Icons.language),
      title: Text(LocaleKeys.language.tr()),
      trailing: DropdownButton<String>(
        value: context.locale.countryCode,
        items: widgets, 
        onChanged: (String value) {
          context.locale = LanguageUtils.mapLocale[value];
        }
      ),
    );
  }

  Widget _makeSettingDarkModeItem() {
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeModel, child) {
        return ListTile(
          leading: Icon(Icons.settings),
          title: Text(tr("dark_mode")),
          trailing: Switch(
            value: themeModel.isDarkMode(),
            inactiveThumbColor: Colors.blue,
            inactiveTrackColor: Colors.grey.withOpacity(0.5),
            activeTrackColor: Colors.blue,
            activeColor: Colors.blue,
            onChanged: (bool isChange) {
              themeModel.setThemeMode(themeModel.isDarkMode() ? ThemeMode.light : ThemeMode.dark);
            }
          ),
        );
      },
    );
  }
}