// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

    static const Map<String,dynamic> en_US = {
  "title": "Hello",
  "dark_mode": "Dark Mode",
  "english_language": "English",
  "vietnamese_language": "Vietnamese",
  "language": "Language"
};
  static const Map<String,dynamic> vi_VN = {
  "title": "Xin chào",
  "dark_mode": "Chế độ nền tối",
  "english_language": "Tiếng Anh",
  "vietnamese_language": "Tiếng Việt",
  "language": "Ngôn ngữ"
};
  static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "vi_VN": vi_VN};
}
