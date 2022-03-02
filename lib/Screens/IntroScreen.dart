import 'package:finalproject/Screens/LogScreen.dart';
import 'package:finalproject/Screens/RegScreen.dart';
import 'package:finalproject/Utils/Coordinate.dart';
import 'package:finalproject/Servecis/Navigation.dart';
import 'package:finalproject/Utils/Informations.dart';
import 'package:finalproject/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:finalproject/Servecis/DataPersitance.dart';

class IntroScreen extends StatefulWidget {
  static const String id = 'IntroScreen';
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<PageViewModel> getPages(double width, double height) {
    return [
      PageViewModel(
        image: Image.asset(
          "lib/Assets/language.jpg",
          width: width * 0.9,
          height: 0.3 * height,
        ),
        title: S.of(context).ChooseLanguagePhrase,
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ActionChip(
                backgroundColor: coordinate.blue,
                label: Text(S.of(context).english),
                onPressed: () {
                  Provider.of<settings>(context, listen: false)
                      .changeLanguage(Language.en);
                  Data.storeLanguage("English");
                  S.load(Locale("en", "US"));
                }),
            ActionChip(
                backgroundColor: coordinate.blue,
                label: Text(S.of(context).Spanish),
                onPressed: () {
                  Provider.of<settings>(context, listen: false)
                      .changeLanguage(Language.es);
                  Data.storeLanguage("Spanish");
                  S.load(Locale("es", "ESP"));
                }),
            ActionChip(
                backgroundColor: coordinate.blue,
                label: Text(S.of(context).arabic),
                onPressed: () {
                  Provider.of<settings>(context, listen: false)
                      .changeLanguage(Language.ar);
                  Data.storeLanguage("Arabic");
                  S.load(Locale("ar", "AR"));
                })
          ],
        ),
      ),
      PageViewModel(
          image: Image.asset("lib/Assets/intro1.jpg",
              width: width * 0.9, height: 0.3 * height),
          title: S.of(context).Ingredients,
          body: S.of(context).IngredientsDescription),
      PageViewModel(
          image: Image.asset("lib/Assets/intro2.jpg",
              width: width * 0.9, height: 0.3 * height),
          title: S.of(context).Recipes,
          body: S.of(context).RecipeDescription),
      PageViewModel(
          image: Image.asset("lib/Assets/intro3.jpg",
              width: width * 0.9, height: 0.3 * height),
          title: S.of(context).Programs,
          body: S.of(context).ProgramsDescription)
    ];
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: IntroductionScreen(
          globalBackgroundColor: coordinate.yalow,
          pages: getPages(width, height),
          done: Text(S.of(context).Done),
          onDone: () {
            if(Provider.of<settings>(context,listen: false).isFirstTime==false)
              Navigator.of(context).pushReplacement(RouteGenerator.generateRoute(
                  RouteSettings(name: RegisterScreen.id)));
              else
            Navigator.of(context).pushReplacement(RouteGenerator.generateRoute(
                RouteSettings(name: LoginScreen.id)));
          },
          showNextButton: false),
    );
  }
}
