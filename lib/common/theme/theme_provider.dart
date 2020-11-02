import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider({bool isLightTheme = false}) : isLightThemeValue = isLightTheme;

  ThemeData get theme => isLightTheme ? lightTheme : darkTheme;

  bool isLightThemeValue;
  bool get isLightTheme => isLightThemeValue;
  set isLightTheme(bool isLightTheme) {
    isLightThemeValue = isLightTheme;
    notifyListeners();
  }

  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: Color(0xFF000000),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black54,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: Color(0xFFE5E5E5),
    accentColor: Colors.red,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );
}
