import 'package:finalproject/Screens/IntroScreen.dart';
import 'package:finalproject/Screens/LogScreen.dart';
import 'package:finalproject/Servecis/API.dart';
import 'package:finalproject/Servecis/DataPersitance.dart';
import 'package:finalproject/Servecis/Navigation.dart';
import 'package:finalproject/Utils/Coordinate.dart';
import 'package:finalproject/Utils/Informations.dart';
import 'package:finalproject/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var animationController;
  var colorTween;
  @override
  void initState() {
    // TODO: implement initState
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    colorTween = animationController
        .drive(ColorTween(begin: coordinate.orange, end: coordinate.blue));
    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(55);
    Function callApi = () async {
      await Data.getFavourites().then((value) {
        if (value != null)
          Provider.of<settings>(context, listen: false)
              .favourites
              .addAll(value.toSet());
      }).whenComplete(() => print(1));
      await Data.getLastRecipes().then((value) {
        if (value != null)
          Provider.of<settings>(context, listen: false)
              .lastRecipes
              .addAll(value.toSet());
      }).whenComplete(() => print(2));
      await Data.getUserName().then((value) {
        Provider.of<settings>(context, listen: false).userName =
            value == null ? "root" : value;
      }).whenComplete(() => print(3));
      await Data.getFirstName().then((value) {
        Provider.of<settings>(context, listen: false).firstName =
            value == null ? "root" : value;
      }).whenComplete(() => print(4));
      await Data.getLastName().then((value) {
        Provider.of<settings>(context, listen: false).lastName =
            value == null ? "root" : value;
      }).whenComplete(() => print(5));
      await Data.getPassword().then((value) {
        Provider.of<settings>(context, listen: false).password =
            value == null ? "root" : value;
      }).whenComplete(() => print(6));
      await Data.getEmail().then((value) {
        Provider.of<settings>(context, listen: false).email =
            value == null ? "root" : value;
      }).whenComplete(() => print(7));
      await Data.getGeneratedCode().then((value) {
        Provider.of<settings>(context, listen: false).generatedCode =
            value == null ? "root" : value;
      }).whenComplete(() => print(8));
      await Data.getIsFirstTime().then((value) {
        Provider.of<settings>(context, listen: false).isFirstTime =
            value == null || value == true ? true : false;
      }).whenComplete(() => print(9));
      await Data.getRememberMe().then((value) {
        Provider.of<settings>(context, listen: false).rememberMe =
            value == null || value == false ? false : true;
      }).whenComplete(() => print(10));
      await Future.forEach(
          Provider.of<settings>(context, listen: false).lastRecipes, (element) {
        Provider.of<SearchResult>(context, listen: false)
            .getRecipe(searchType.lastRecipes, id: element as String);
      }).whenComplete(() => print(11));

      await Future.forEach(
          Provider.of<settings>(context, listen: false).favourites, (element) {
        Provider.of<SearchResult>(context, listen: false)
            .getRecipe(searchType.favourites, id: element as String);
      }).whenComplete(() => print(12));

      await Provider.of<SearchResult>(context, listen: false).getRecipe(
          searchType.findByIngredients,
          ingredients: ['fruits']).whenComplete(() => print(13));
      await Provider.of<SearchResult>(context, listen: false)
          .getRecipe(searchType.random)
          .whenComplete(() => print(14));
      print("aa");
      return;
    };
    return Scaffold(
      backgroundColor: coordinate.red,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "lib/Assets/splashscreen.jpg",
              width: width * 0.7,
              height: height * 0.7,
            ),
            AutoSizeText(
              S.of(context).Title,
              style: TextStyle(
                  color: coordinate.orange,
                  fontFamily: coordinate.getFont(),
                  fontSize: width * 0.02 + height * 0.02),
            ),
            FutureBuilder(
                future: callApi().whenComplete(() {
                  print("ff");
                  print(
                      Provider.of<settings>(context, listen: false).firstName);
                  print(Provider.of<settings>(context, listen: false)
                      .generatedCode);
                  animationController.stop();
                  if (Provider.of<settings>(context, listen: false).isFirstTime)
                    Navigator.of(context).pushReplacement(
                        RouteGenerator.generateRoute(
                            RouteSettings(name: IntroScreen.id)));
                  else {
                    Navigator.of(context).pushReplacement(
                        RouteGenerator.generateRoute(
                            RouteSettings(name: LoginScreen.id)));
                  }
                }),
                builder: (context, snapshot) {
                  return CircularProgressIndicator(
                    valueColor: colorTween,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
