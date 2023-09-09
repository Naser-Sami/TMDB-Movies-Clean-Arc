import 'package:shared_preferences/shared_preferences.dart';

import '../../core.dart';

class SharedPreferenceService {
  final SharedPreferences _sharedPreferences;
  SharedPreferenceService(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(Constants.prefsKeyLang);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // .. return default language
      return LanguageType.ENGLISH.getValue();
    }
  }
}
