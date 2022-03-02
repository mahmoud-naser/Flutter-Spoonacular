import 'package:finalproject/Screens/AccountInformation.dart';
import 'package:finalproject/Screens/ChangeLanguage.dart';
import 'package:finalproject/Screens/ChangeScreen.dart';
import 'package:finalproject/Screens/ForgetScreen.dart';
import 'package:finalproject/Screens/IntroScreen.dart';
import 'package:finalproject/Screens/LogScreen.dart';
import 'package:finalproject/Screens/MainScreen.dart';
import 'package:finalproject/Screens/RecipeDetailsScreen.dart';
import 'package:finalproject/Screens/RegScreen.dart';
import 'package:finalproject/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String SplashPage = SplashScreen.id;
  static const String IntroPage = IntroScreen.id;
  static const String LoginPage = LoginScreen.id;
  static const String RegisterPage = RegisterScreen.id;
  static const String MainPage = Screen.id;
  static const String ChangePage = ChangePassword.id;
  static const String ForgetPage = ForgetPassword.id;
  static const String AccountPage = AccountScreen.id;
  static const String LanguagePage = LanguageScreen.id;
  static const String DetailsPage = DetailsScreen.id;

  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage:
        return MaterialPageRoute(
            builder: (_) => SplashScreen(), settings: settings);
      case IntroPage:
        return MaterialPageRoute(
            builder: (_) => IntroScreen(), settings: settings);
      case LoginPage:
        return MaterialPageRoute(
            builder: (_) => LoginScreen(), settings: settings);
      case RegisterPage:
        return MaterialPageRoute(
            builder: (_) => RegisterScreen(), settings: settings);
      case MainPage:
        return MaterialPageRoute(builder: (_) => Screen(), settings: settings);
      case ChangePage:
        return MaterialPageRoute(
            builder: (_) => ChangePassword(), settings: settings);
      case AccountPage:
        return MaterialPageRoute(
            builder: (_) => AccountScreen(), settings: settings);
      case ForgetPage:
        return MaterialPageRoute(
            builder: (_) => ForgetPassword(), settings: settings);
      case LanguagePage:
        return MaterialPageRoute(
            builder: (_) => LanguageScreen(), settings: settings);
      case DetailsPage:
        return MaterialPageRoute(
            builder: (_) => DetailsScreen(), settings: settings);
      default:
        throw FormatException("Route not found");
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
