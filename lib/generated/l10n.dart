// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Dr Food`
  String get Title {
    return Intl.message(
      'Dr Food',
      name: 'Title',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Spanish`
  String get Spanish {
    return Intl.message(
      'Spanish',
      name: 'Spanish',
      desc: '',
      args: [],
    );
  }

  /// `Choose the language`
  String get ChooseLanguagePhrase {
    return Intl.message(
      'Choose the language',
      name: 'ChooseLanguagePhrase',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients`
  String get Ingredients {
    return Intl.message(
      'Ingredients',
      name: 'Ingredients',
      desc: '',
      args: [],
    );
  }

  /// `You can ask us about the ingredients of foods and the elements in these ingredients`
  String get IngredientsDescription {
    return Intl.message(
      'You can ask us about the ingredients of foods and the elements in these ingredients',
      name: 'IngredientsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Recipes`
  String get Recipes {
    return Intl.message(
      'Recipes',
      name: 'Recipes',
      desc: '',
      args: [],
    );
  }

  /// `You can ask us about the most delicious recipes and how to prepare these recipes with the necessary tools`
  String get RecipeDescription {
    return Intl.message(
      'You can ask us about the most delicious recipes and how to prepare these recipes with the necessary tools',
      name: 'RecipeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Programs`
  String get Programs {
    return Intl.message(
      'Programs',
      name: 'Programs',
      desc: '',
      args: [],
    );
  }

  /// `We can offer you a weekly program that contains the foods that you will eat and make you more healthy`
  String get ProgramsDescription {
    return Intl.message(
      'We can offer you a weekly program that contains the foods that you will eat and make you more healthy',
      name: 'ProgramsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get Done {
    return Intl.message(
      'Done',
      name: 'Done',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get RegisterWord {
    return Intl.message(
      'Register',
      name: 'RegisterWord',
      desc: '',
      args: [],
    );
  }

  /// `I don't have account !!`
  String get NoAccount {
    return Intl.message(
      'I don\'t have account !!',
      name: 'NoAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get LoginWord {
    return Intl.message(
      'Login',
      name: 'LoginWord',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get EmailWord {
    return Intl.message(
      'Email',
      name: 'EmailWord',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get EmailPhrase1 {
    return Intl.message(
      'Enter your email',
      name: 'EmailPhrase1',
      desc: '',
      args: [],
    );
  }

  /// `Bad Email`
  String get EmailPhrase2 {
    return Intl.message(
      'Bad Email',
      name: 'EmailPhrase2',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get RequiredWord {
    return Intl.message(
      'Required',
      name: 'RequiredWord',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get PasswordPhrase1 {
    return Intl.message(
      'Enter your password',
      name: 'PasswordPhrase1',
      desc: '',
      args: [],
    );
  }

  /// `Not hard Password`
  String get PasswordPhrase2 {
    return Intl.message(
      'Not hard Password',
      name: 'PasswordPhrase2',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get PasswordForget {
    return Intl.message(
      'Forget Password ?',
      name: 'PasswordForget',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get PasswordConfirm {
    return Intl.message(
      'Confirm Password',
      name: 'PasswordConfirm',
      desc: '',
      args: [],
    );
  }

  /// `problem in confirm`
  String get PasswordConfirmProblem {
    return Intl.message(
      'problem in confirm',
      name: 'PasswordConfirmProblem',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get UserName {
    return Intl.message(
      'User Name',
      name: 'UserName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your user name`
  String get UserNamePhrase1 {
    return Intl.message(
      'Enter your user name',
      name: 'UserNamePhrase1',
      desc: '',
      args: [],
    );
  }

  /// `UserName is not valid`
  String get UserNamePhrase2 {
    return Intl.message(
      'UserName is not valid',
      name: 'UserNamePhrase2',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get FirstName {
    return Intl.message(
      'First Name',
      name: 'FirstName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your first name`
  String get FirstNamePhrase {
    return Intl.message(
      'Enter your first name',
      name: 'FirstNamePhrase',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get LastName {
    return Intl.message(
      'Last Name',
      name: 'LastName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your last name`
  String get LastNamePhrase {
    return Intl.message(
      'Enter your last name',
      name: 'LastNamePhrase',
      desc: '',
      args: [],
    );
  }

  /// `Fish`
  String get Fish {
    return Intl.message(
      'Fish',
      name: 'Fish',
      desc: '',
      args: [],
    );
  }

  /// `Chicken`
  String get Chicken {
    return Intl.message(
      'Chicken',
      name: 'Chicken',
      desc: '',
      args: [],
    );
  }

  /// `Meat`
  String get Meat {
    return Intl.message(
      'Meat',
      name: 'Meat',
      desc: '',
      args: [],
    );
  }

  /// `Burger`
  String get Burger {
    return Intl.message(
      'Burger',
      name: 'Burger',
      desc: '',
      args: [],
    );
  }

  /// `Vegetables`
  String get Vegetables {
    return Intl.message(
      'Vegetables',
      name: 'Vegetables',
      desc: '',
      args: [],
    );
  }

  /// `Fruits`
  String get Fruits {
    return Intl.message(
      'Fruits',
      name: 'Fruits',
      desc: '',
      args: [],
    );
  }

  /// `Filtered recipes`
  String get FilteredRecipes {
    return Intl.message(
      'Filtered recipes',
      name: 'FilteredRecipes',
      desc: '',
      args: [],
    );
  }

  /// `Popular recipes`
  String get PopularRecipes {
    return Intl.message(
      'Popular recipes',
      name: 'PopularRecipes',
      desc: '',
      args: [],
    );
  }

  /// `Your last recipes`
  String get YourLastRecipes {
    return Intl.message(
      'Your last recipes',
      name: 'YourLastRecipes',
      desc: '',
      args: [],
    );
  }

  /// `Your favourite recipes`
  String get YourFavouriteRecipes {
    return Intl.message(
      'Your favourite recipes',
      name: 'YourFavouriteRecipes',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get Account {
    return Intl.message(
      'Account',
      name: 'Account',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get Dark {
    return Intl.message(
      'Dark',
      name: 'Dark',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get About {
    return Intl.message(
      'About',
      name: 'About',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Forget generated code !!`
  String get ForgetGeneratedCode {
    return Intl.message(
      'Forget generated code !!',
      name: 'ForgetGeneratedCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter your old generated code`
  String get OldCode {
    return Intl.message(
      'Enter your old generated code',
      name: 'OldCode',
      desc: '',
      args: [],
    );
  }

  /// `New generated code`
  String get NewCode {
    return Intl.message(
      'New generated code',
      name: 'NewCode',
      desc: '',
      args: [],
    );
  }

  /// `Code generation`
  String get CodeGeneration {
    return Intl.message(
      'Code generation',
      name: 'CodeGeneration',
      desc: '',
      args: [],
    );
  }

  /// `please don't change the code because this will make problems`
  String get ChangingCodeWarning {
    return Intl.message(
      'please don\'t change the code because this will make problems',
      name: 'ChangingCodeWarning',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get OK {
    return Intl.message(
      'OK',
      name: 'OK',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get Confirm {
    return Intl.message(
      'Confirm',
      name: 'Confirm',
      desc: '',
      args: [],
    );
  }

  /// `Code generation error`
  String get CodeGenerationError {
    return Intl.message(
      'Code generation error',
      name: 'CodeGenerationError',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get TryAgain {
    return Intl.message(
      'Try again',
      name: 'TryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Generate code`
  String get GenerateCode {
    return Intl.message(
      'Generate code',
      name: 'GenerateCode',
      desc: '',
      args: [],
    );
  }

  /// `Generated code`
  String get GeneratedCode {
    return Intl.message(
      'Generated code',
      name: 'GeneratedCode',
      desc: '',
      args: [],
    );
  }

  /// `Change Code`
  String get ChangeCode {
    return Intl.message(
      'Change Code',
      name: 'ChangeCode',
      desc: '',
      args: [],
    );
  }

  /// `The code has been changed successfully`
  String get ChangeCodeMassage {
    return Intl.message(
      'The code has been changed successfully',
      name: 'ChangeCodeMassage',
      desc: '',
      args: [],
    );
  }

  /// `I am Mahmod Nasser Eldin I am studying Information Technology contact me 0935207580`
  String get Hint {
    return Intl.message(
      'I am Mahmod Nasser Eldin I am studying Information Technology contact me 0935207580',
      name: 'Hint',
      desc: '',
      args: [],
    );
  }

  /// `Noodle`
  String get Noodle {
    return Intl.message(
      'Noodle',
      name: 'Noodle',
      desc: '',
      args: [],
    );
  }

  /// `Rice`
  String get Rice {
    return Intl.message(
      'Rice',
      name: 'Rice',
      desc: '',
      args: [],
    );
  }

  /// `salad`
  String get Salad {
    return Intl.message(
      'salad',
      name: 'Salad',
      desc: '',
      args: [],
    );
  }

  /// `No Internet !!`
  String get NoInternet {
    return Intl.message(
      'No Internet !!',
      name: 'NoInternet',
      desc: '',
      args: [],
    );
  }

  /// `UserName is not true`
  String get UserNameError {
    return Intl.message(
      'UserName is not true',
      name: 'UserNameError',
      desc: '',
      args: [],
    );
  }

  /// `Generated code is not true`
  String get PasswordError {
    return Intl.message(
      'Generated code is not true',
      name: 'PasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get RememberMe {
    return Intl.message(
      'Remember Me',
      name: 'RememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Equipment`
  String get Equipment {
    return Intl.message(
      'Equipment',
      name: 'Equipment',
      desc: '',
      args: [],
    );
  }

  /// `Recipe Nutrition`
  String get RecipeNutrition {
    return Intl.message(
      'Recipe Nutrition',
      name: 'RecipeNutrition',
      desc: '',
      args: [],
    );
  }

  /// `Recipe Nutrition Label`
  String get RecipeNutritionLabel {
    return Intl.message(
      'Recipe Nutrition Label',
      name: 'RecipeNutritionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get Price {
    return Intl.message(
      'Price',
      name: 'Price',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
