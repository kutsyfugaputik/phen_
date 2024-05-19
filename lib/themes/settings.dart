import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:phen/models/order.dart';
import 'package:phen/models/user.dart';
import 'package:phen/themes/modes.dart';
import 'package:path_provider/path_provider.dart';

class SettingApp with ChangeNotifier {
  late Future<Isar> db;

  SettingApp() {
    db = openDB();
  }

  static late Isar isar;
  static late User user_id;

  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;

  static const List<String> availableFontFamilies = ['Oswald', 'PlayfairDisplay', 'Podkova'];

  String _selectedFontFamily = 'Oswald';
  String get selectedFontFamily => _selectedFontFamily;

  double _fontSizeMultiplier = 1.0;
  double get fontSizeMultiplier => _fontSizeMultiplier;

  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([OrderSchema, UserSchema], directory: dir.path);
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [UserSchema, OrderSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else if (_themeData == darkMode) {
      themeData = blueMode;
    } else if (_themeData == blueMode) {
      themeData = brownMode;
    } else if (_themeData == brownMode) {
      themeData = redMode;
    } else {
      themeData = lightMode;
    }
  }

  void setFontFamily(String fontFamily) {
    _selectedFontFamily = fontFamily;
    notifyListeners();
  }

  void setFontSizeMultiplier(double multiplier) {
    _fontSizeMultiplier = multiplier;
    notifyListeners();
  }
}