import 'package:shared_preferences/shared_preferences.dart';

class Data {
  Data._() {}

  static void storeUsername(String un) async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs!.setString("User_Name", un);
  }

  static Future<void> storePassword(String pass) async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs!.setString("Password", pass);
  }

  static Future<void> storeFirstName(String fname) async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs!.setString("First_Name", fname);
  }

  static Future<void> storeLastName(String lname) async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs!.setString("Last_Name", lname);
  }

  static Future<void> storeGeneratedCode(String code) async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs!.setString("Generated_Code", code);
  }

  static Future<void> storeEmail(String email) async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs!.setString("Email", email);
  }

  static Future<void> storeFirstTime(bool r) async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs!.setBool("FirstTime", r);
  }

  // static Future<void> storeIsLogin(bool l) async {
  //   final SharedPreferences? prefs = await SharedPreferences.getInstance();
  //   prefs!.setBool("IsLogin", l);
  // }

  static Future<void> storeRememberMe(bool l) async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs!.setBool("RememberMe", l);
  }

  static Future<void> storeLanguage(String lang) async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs!.setString("Language", lang);
  }

  static Future<void> storeTheme(String th) async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs!.setString("Theme", th);
  }

  static Future<void> storeFavourites(List<String> f) async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs!.setStringList("Favourites", f);
  }

  static Future<void> storeLastRecipes(List<String> f) async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs!.setStringList("Last_Recipes", f);
  }

  static Future<String?> getUserName() async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    return prefs!.getString("User_Name");
  }

  static Future<String?> getFirstName() async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    return prefs!.getString("First_Name");
  }

  static Future<String?> getLastName() async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    return prefs!.getString("Last_Name");
  }

  static Future<String?> getPassword() async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    return prefs!.getString("Password");
  }

  static Future<String?> getGeneratedCode() async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    return prefs!.getString("Generated_Code");
  }

  static Future<String?> getEmail() async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    return prefs!.getString("Email");
  }

  static Future<bool?> getIsFirstTime() async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    return prefs!.getBool("FirstTime");
  }

  // static Future<bool?> getIsLogin() async {
  //   final SharedPreferences? prefs = await SharedPreferences.getInstance();
  //   return prefs!.getBool("IsLogin");
  // }

  static Future<bool?> getRememberMe() async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    return prefs!.getBool("RememberMe");
  }

  static Future<String?> getLanguage() async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    return prefs!.getString("Language");
  }

  static Future<String?> getTheme() async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    return prefs!.getString("Theme");
  }

  static Future<List<String>?> getFavourites() async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    return prefs!.getStringList("Favourites");
  }

  static Future<List<String>?> getLastRecipes() async {
    final SharedPreferences? prefs = await SharedPreferences.getInstance();
    return prefs!.getStringList("Last_Recipes");
  }
}
