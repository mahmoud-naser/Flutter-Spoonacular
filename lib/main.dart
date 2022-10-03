import 'package:finalproject/Screens/AccountInformation.dart';
import 'package:finalproject/Screens/ChangeLanguage.dart';
import 'package:finalproject/Screens/ChangeScreen.dart';
import 'package:finalproject/Screens/ForgetScreen.dart';
import 'package:finalproject/Screens/IntroScreen.dart';
import 'package:finalproject/Screens/LogScreen.dart';
import 'package:finalproject/Screens/RecipeDetailsScreen.dart';
import 'package:finalproject/Screens/RegScreen.dart';
import 'package:finalproject/Screens/SplashScreen.dart';
import 'package:finalproject/Servecis/API.dart';
import 'package:finalproject/Servecis/DataPersitance.dart';
import 'package:finalproject/Utils/Informations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/MainScreen.dart';
import 'package:finalproject/Widgets/CircularChart.dart';
import 'generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

main() {
  //PieChartWidget(names_percentages: {'mah':10,'alal':30,'fs':40,'vfdsv':20},Images: [],)
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchResult>(create: (BuildContext context) {
          return SearchResult();
        }),
        ChangeNotifierProvider<settings>(
          create: (BuildContext context) {
            return settings();
          },
        ),
      ],
      child: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Data.getLanguage().then((value) {
      (value == "English" || value == null)
          ? Provider.of<settings>(context, listen: false).lang = Language.en
          : (value == "Spanish"
              ? Provider.of<settings>(context, listen: false).lang = Language.es
              : Provider.of<settings>(context, listen: false).lang =
                  Language.ar);
      Provider.of<settings>(context, listen: false).locale =
          Provider.of<settings>(context, listen: false).getLocal();
    });
    Data.getTheme().then((value) {
      Provider.of<settings>(context, listen: false).theme = value == "Light"
          ? ThemeMode.light
          : (value == null ? ThemeMode.system : ThemeMode.dark);
    });

    return MaterialApp(
      themeMode: Provider.of<settings>(context).theme,
      home: SplashScreen(),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Provider.of<settings>(context).locale,
      routes: {
        IntroScreen.id: (context) {
          return IntroScreen();
        },
        LoginScreen.id: (context) {
          return LoginScreen();
        },
        RegisterScreen.id: (context) {
          return RegisterScreen();
        },
        Screen.id: (context) {
          return Screen();
        },
        ChangePassword.id: (context) {
          return ChangePassword();
        },
        AccountScreen.id: (context) {
          return AccountScreen();
        },
        ForgetPassword.id: (context) {
          return ForgetPassword();
        },
        LanguageScreen.id: (context) {
          return LanguageScreen();
        },
        DetailsScreen.id: (context) {
          return DetailsScreen();
        }
      },
    );
  }
}
