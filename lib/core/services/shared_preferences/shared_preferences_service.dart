import 'package:shared_preferences/shared_preferences.dart';

import '../../core.dart';

class SharedPreferenceService {
  final SharedPreferences _sharedPreferences;
  SharedPreferenceService(this._sharedPreferences);

  // Saving String value
  addStringToSF(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  // Saving int value
  addIntToSF(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  // Saving double value
  addDoubleToSF(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  // Saving boolean value
  addBoolToSF(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  // Read data
  getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString(key) ?? "";
    return stringValue;
  }

  Future<bool> getBoolValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool boolValue = prefs.getBool(key) ?? false;
    return boolValue;
  }

  getIntValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int intValue = prefs.getInt(key) ?? 0;
    return intValue;
  }

  getDoubleValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    double doubleValue = prefs.getDouble(key) ?? 0.0;
    return doubleValue;
  }

  // Remove data
  removeStringValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove(key);
  }

  removeIntValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove Integer
    prefs.remove(key);
  }

  removeDoubleValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Remove double
    prefs.remove("doubleValue");
  }

  removeBoolValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove Boolean
    prefs.remove(key);
  }

  // Check value if present or not?
  checkValueIfPresent(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool checkValue = prefs.containsKey(key);
    return checkValue;
  }

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
