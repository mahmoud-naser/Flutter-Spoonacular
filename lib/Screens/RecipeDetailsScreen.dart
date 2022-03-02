import 'dart:io';
import 'package:finalproject/Servecis/API.dart';
import 'package:finalproject/generated/l10n.dart';
import 'package:like_button/like_button.dart';
import 'package:finalproject/Utils/Informations.dart';
import 'package:finalproject/Utils/Coordinate.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/Servecis/DataPersitance.dart';
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';

enum InfoType { Equipment, RecipeNutrition, RecipeNutritionLabel }

class DetailsScreen extends StatefulWidget {
  static const String id = "Details_Screen";
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  late WebViewController controller;
  var animationController;
  var colorTween;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
      animationController =
          AnimationController(vsync: this, duration: Duration(seconds: 2));
      colorTween = animationController
          .drive(ColorTween(begin: coordinate.orange, end: coordinate.blue));
      animationController.repeat();
    }
  }

  Future<String> loadHtml(String id, InfoType i) async {
    Widgets w = Widgets();
    final url;
    switch (i) {
      case InfoType.Equipment:
        {
          url = Uri.dataFromString(await w.getEquipmentWidget(id),
                  mimeType: "text/html", encoding: Encoding.getByName("utf-8"))
              .toString();
          break;
        }
      case InfoType.RecipeNutrition:
        {
          url = Uri.dataFromString(await w.getRecipeNutritionWidget(id),
                  mimeType: "text/html", encoding: Encoding.getByName("utf-8"))
              .toString();
          break;
        }
      case InfoType.RecipeNutritionLabel:
        {
          url = Uri.dataFromString(await w.getRecipeNutritionLabelWidget(id),
                  mimeType: "text/html", encoding: Encoding.getByName("utf-8"))
              .toString();
          break;
        }
    }
    return url;
  }

  void bottomSheet(String id, InfoType i) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        context: context,
        builder: (_) {
          return FutureBuilder(
            future: loadHtml(id, i),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done)
                return WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (webcontroller) {
                    controller = webcontroller;
                    controller.loadUrl(snapshot.data);
                  },
                );
              else
                return ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: Center(
                        child: CircularProgressIndicator(
                      valueColor: colorTween,
                    )));
            },
          );
        });
  }

  Widget build(BuildContext context) {
    List info = List.of(ModalRoute.of(context)!.settings.arguments as List);
    Recipe r;
    if (info[1] == searchType.random)
      r = Provider.of<SearchResult>(context, listen: false)
          .responseRandom[info[0]];
    else if (info[1] == searchType.favourites)
      r = Provider.of<SearchResult>(context, listen: false)
          .responseFavourites
          .elementAt(info[0]);
    else if (info[1] == searchType.lastRecipes)
      r = Provider.of<SearchResult>(context, listen: false)
          .responseLastRecipes
          .elementAt(info[0]);
    else
      r = r = Provider.of<SearchResult>(context, listen: false)
          .responseIngredients[info[0]];

    return Scaffold(
      backgroundColor: coordinate.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            r.image.toString(),
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '${r.title}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
          Center(
            child: Visibility(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('minutes : ${r.minutes} ',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w900)),
                ),
                visible: r.minutes == null ||
                        r.minutes == 0.toString() ||
                        r.minutes == null.toString()
                    ? false
                    : true),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LikeButton(
              isLiked: Provider.of<settings>(context, listen: false)
                      .favourites
                      .contains(r.id.toString())
                  ? false
                  : null,
              likeCountAnimationDuration: Duration(seconds: 1),
              circleColor:
                  CircleColor(start: coordinate.orange, end: coordinate.red),
              bubblesColor: BubblesColor(
                dotPrimaryColor: coordinate.orange,
                dotSecondaryColor: coordinate.red,
              ),
              onTap: (bool tapped) async {
                if (!Provider.of<settings>(context, listen: false)
                    .favourites
                    .contains(r.id.toString())) {
                  Provider.of<settings>(context, listen: false)
                      .favourites
                      .add(r.id.toString());
                  Provider.of<SearchResult>(context, listen: false)
                      .responseFavourites
                      .add(Recipe(searchType.favourites, r.id, r.title,
                          image: r.image,
                          minutes: r.minutes != null ? r.minutes! : 0));
                  Data.storeFavourites(
                      Provider.of<settings>(context, listen: false)
                          .favourites
                          .toList());
                } else {
                  Provider.of<settings>(context, listen: false)
                      .favourites
                      .remove(r.id.toString());
                  Data.storeFavourites(
                      Provider.of<settings>(context, listen: false)
                          .favourites
                          .toList());
                }
                await Future.sync(() {
                  setState(() {});
                });
              },
              likeBuilder: (bool isLiked) {
                return Icon(
                  Provider.of<settings>(context, listen: false)
                          .favourites
                          .contains(r.id.toString())
                      ? Icons.favorite_outlined
                      : Icons.favorite_border,
                  color: Provider.of<settings>(context, listen: false)
                          .favourites
                          .contains(r.id.toString())
                      ? coordinate.red
                      : coordinate.orange,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ActionChip(
                  backgroundColor: coordinate.yalow,
                  label: Text(
                    S.of(context).Equipment,
                    style: TextStyle(color: coordinate.red),
                  ),
                  onPressed: () {
                    bottomSheet(r.id.toString(), InfoType.Equipment);
                  }),
              ActionChip(
                  backgroundColor: coordinate.yalow,
                  label: Text(
                    S.of(context).RecipeNutrition,
                    style: TextStyle(color: coordinate.red),
                  ),
                  onPressed: () {
                    bottomSheet(r.id.toString(), InfoType.RecipeNutrition);
                  }),
              ActionChip(
                  backgroundColor: coordinate.yalow,
                  label: Text(
                    S.of(context).RecipeNutritionLabel,
                    style: TextStyle(color: coordinate.red),
                  ),
                  onPressed: () {
                    bottomSheet(r.id.toString(), InfoType.RecipeNutritionLabel);
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ActionChip(
                  backgroundColor: coordinate.yalow,
                  label: Text(
                    S.of(context).Price,
                    style: TextStyle(color: coordinate.red),
                  ),
                  onPressed: () {
                  }),
              ActionChip(
                  backgroundColor: coordinate.yalow,
                  label: Text(
                    S.of(context).english,
                    style: TextStyle(color: coordinate.red),
                  ),
                  onPressed: () {
                    Provider.of<settings>(context, listen: false)
                        .changeLanguage(Language.en);
                    Data.storeLanguage("English");
                    S.load(Locale("en", "US"));
                  }),
              ActionChip(
                  backgroundColor: coordinate.yalow,
                  label: Text(
                    S.of(context).english,
                    style: TextStyle(color: coordinate.red),
                  ),
                  onPressed: () {
                    Provider.of<settings>(context, listen: false)
                        .changeLanguage(Language.en);
                    Data.storeLanguage("English");
                    S.load(Locale("en", "US"));
                  })
            ],
          )
        ],
      ),
    );
  }
}


