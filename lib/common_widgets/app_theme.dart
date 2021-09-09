import 'package:flutter/material.dart';

class CustomColors {
  static const Color lightPurple = Color(0xFFBB86FA);
  static const Color purple = Color(0xFF6002EE);
  static const Color deepPurple = Color(0xFF3900B1);
  static const Color grey = Color(0xFF848484);
  static const Color darkGrey = Color(0xFF222222);
  static const Color black = Color(0xFF141414);
}

class AppTheme extends ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    // UserPreferences().setUserTheme(_isDarkTheme);

    notifyListeners();
  }

  // Light theme
  static ThemeData get lightTheme {
    //1
    return ThemeData(
        //2
        primaryColor: CustomColors.purple,
        scaffoldBackgroundColor: Colors.white,
        buttonTheme: ButtonThemeData(
          // 4
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomColors.lightPurple,
        ));
  }

  // Dark theme
  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: CustomColors.darkGrey,
        scaffoldBackgroundColor: Colors.black,
        textTheme: ThemeData.dark().textTheme,
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomColors.lightPurple,
        ));
  }
}
