import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Language { ar, es, en }

class settings with ChangeNotifier {
  Language lang = Language.en;
  late String userName;
  late String firstName;
  late String lastName;
  late String generatedCode;
  late String password;
  late String email;
  late bool isFirstTime;
  late bool rememberMe;
  late Set<String> favourites = {"209128", "31868"};
  late Set<String> lastRecipes = {"209128", "31868"};
  late ThemeMode theme = ThemeMode.system;
  late Locale locale = Locale("en");

  void changeLanguage(Language l) {
    lang = l;
    setLocal();
    notifyListeners();
    //store in database
  }

  void changePassword(String s) {
    generatedCode = s;
    notifyListeners();
  }

  void changeTheme() {
    if (theme == ThemeMode.dark)
      theme = ThemeMode.light;
    else
      theme = ThemeMode.dark;
    notifyListeners();
  }

  void setLocal() {
    if (lang == Language.en)
      locale = Locale("en");
    else if (lang == Language.es)
      locale = Locale("es");
    else
      locale = Locale("ar");
  }

  Locale getLocal() {
    if (lang == Language.en)
      return Locale("en");
    else if (lang == Language.es)
      return Locale("es");
    else
      return Locale("ar");
  }
}
