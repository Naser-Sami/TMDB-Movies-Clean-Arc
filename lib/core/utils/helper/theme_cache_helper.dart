import 'package:shared_preferences/shared_preferences.dart';

import '/core/core.dart';

class ThemeCacheHelper {
  Future<void> cacheThemeIndex(int themeIndex) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(Constants.themeIndex, themeIndex);
  }

  Future<int> getCachedThemeIndex() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedThemeIndex = sharedPreferences.getInt(Constants.themeIndex) ?? 0;

    return cachedThemeIndex;
  }
}
