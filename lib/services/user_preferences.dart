import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  late SharedPreferences _preferences;
  final String _themePreference = 'isDarkTheme';

  Future init() async => _preferences = await SharedPreferences.getInstance();

  Future setUserTheme(bool isDarkTheme) async =>
      await _preferences.setBool(_themePreference, isDarkTheme);

  bool? getUserTheme() => _preferences.getBool(_themePreference);
}
