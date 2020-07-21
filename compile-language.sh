flutter pub get
flutter pub run easy_localization:generate -s assets/translations -f json -o codegen_loader.g.dart -O lib/generated
flutter pub run easy_localization:generate -s assets/translations -f keys -o locale_keys.g.dart -O lib/generated
