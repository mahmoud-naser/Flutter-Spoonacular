import 'package:finalproject/Screens/AccountInformation.dart';
import 'package:finalproject/Screens/ChangeLanguage.dart';
import 'package:finalproject/Servecis/DataPersitance.dart';
import 'package:finalproject/Utils/Coordinate.dart';
import 'package:finalproject/Utils/Informations.dart';
import 'package:finalproject/Servecis/Navigation.dart';
import 'package:finalproject/Widgets/Chip.dart';
import 'package:finalproject/Widgets/MyCard.dart';
import 'package:finalproject/Widgets/NoInternet.dart';
import 'package:finalproject/generated/l10n.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/Servecis/API.dart';
import 'package:finalproject/Screens/RecipeDetailsScreen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class Screen extends StatefulWidget {
  static const String id = "MainScreen";
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<SearchResult>(context, listen: false)
        .responseRandom
        .length);
    return Scaffold(
      backgroundColor: coordinate.blue,
      body: LayoutBuilder(builder: (context, constarins) {
        return RefreshIndicator(
          onRefresh: () {
            return Future.sync(() async {
              Provider.of<SearchResult>(context, listen: false)
                  .responseFavourites
                  .removeWhere((element) =>
                      !Provider.of<settings>(context, listen: false)
                          .favourites
                          .contains(element.id.toString()));
              // await Future.forEach(
              //     Provider.of<settings>(context, listen: false).lastRecipes,
              //     (element) {
              //   if (!Provider.of<SearchResult>(context, listen: false)
              //       .responseLastRecipes
              //       .contains(element))
              //     Provider.of<SearchResult>(context, listen: false)
              //         .getRecipe(searchType.lastRecipes, id: element as String);
              // });
              // await Future.forEach(
              //     Provider.of<settings>(context, listen: false).favourites,
              //     (element) {
              //   if (!Provider.of<SearchResult>(context, listen: false)
              //       .responseFavourites
              //       .contains(element))
              //     Provider.of<SearchResult>(context, listen: false)
              //         .getRecipe(searchType.favourites, id: element as String);
              // });
            }).whenComplete(() => setState(() {
                  print("hhh");
                }));
          },
          child: ListView(scrollDirection: Axis.vertical, children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Wrap(
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MyChip(
                      title: S.of(context).Fish,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MyChip(title: S.of(context).Chicken),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MyChip(
                      title: S.of(context).Meat,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MyChip(
                      title: S.of(context).Noodle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MyChip(
                      title: S.of(context).Salad,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MyChip(
                      title: S.of(context).Vegetables,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MyChip(
                      title: S.of(context).Fruits,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MyChip(
                      title: S.of(context).Rice,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).FilteredRecipes,
                style: TextStyle(color: coordinate.red),
              ),
            ),
            Provider.of<SearchResult>(context, listen: false)
                        .responseIngredients
                        .length !=
                    0
                ? Container(
                    height: constarins.maxHeight * 0.35,
                    margin: EdgeInsets.only(right: constarins.maxWidth * 0.05),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      cacheExtent: 100,
                      itemBuilder: (BuildContext context, int index) {
                        int size =
                            Provider.of<SearchResult>(context, listen: false)
                                .responseIngredients
                                .length;
                        if (index == size - 4) {
                          Provider.of<SearchResult>(context, listen: false)
                              .getRecipe(searchType.findByIngredients,
                                  ingredients: ['fruits']);
                        }
                        if (index >= size) {
                          return ConnectionProblem(
                              height: constarins.maxHeight * 0.35,
                              width: constarins.maxWidth * 0.35);
                        } else
                          return GestureDetector(
                            onTap: () {
                              //navigation
                              Navigator.of(context).push(
                                  RouteGenerator.generateRoute(
                                      RouteSettings(name: DetailsScreen.id,arguments: [index,searchType.findByIngredients])));
                              Provider.of<settings>(context, listen: false)
                                  .lastRecipes
                                  .add(Provider.of<SearchResult>(context,
                                          listen: false)
                                      .responseIngredients[index]
                                      .id
                                      .toString());
                              Provider.of<SearchResult>(context, listen: false)
                                  .responseLastRecipes
                                  .add(Provider.of<SearchResult>(context,
                                          listen: false)
                                      .responseIngredients[index]);
                              Data.storeLastRecipes(
                                  Provider.of<settings>(context, listen: false)
                                      .lastRecipes
                                      .toList());
                            },
                            child: MyCard(
                                url: Provider.of<SearchResult>(context,
                                        listen: false)
                                    .responseIngredients[index]
                                    .image
                                    .toString(),
                                name: Provider.of<SearchResult>(context,
                                        listen: false)
                                    .responseIngredients[index]
                                    .title,
                                id: Provider.of<SearchResult>(context,
                                        listen: false)
                                    .responseIngredients[index]
                                    .id
                                    .toString(),
                                height: constarins.maxHeight * 0.35,
                                width: constarins.maxWidth * 0.35),
                          );
                      },
                    ),
                  )
                : ConnectionProblem(
                    height: constarins.maxHeight * 0.35,
                    width: constarins.maxWidth - 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).PopularRecipes,
                style: TextStyle(color: coordinate.red),
              ),
            ),
            Provider.of<SearchResult>(context, listen: false)
                        .responseRandom
                        .length !=
                    0
                ? Container(
                    height: constarins.maxHeight * 0.35,
                    margin: EdgeInsets.only(right: constarins.maxWidth * 0.05),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      cacheExtent: 100,
                      itemBuilder: (BuildContext context, int index) {
                        int size =
                            Provider.of<SearchResult>(context, listen: false)
                                .responseRandom
                                .length;
                        if (index == size - 4) {
                          Provider.of<SearchResult>(context, listen: false)
                              .getRecipe(searchType.random);
                        }
                        if (index >= size) {
                          return ConnectionProblem(
                              height: constarins.maxHeight * 0.35,
                              width: constarins.maxWidth * 0.35);
                        } else
                          return GestureDetector(
                            onTap: () {
                              //navigation
                              Navigator.of(context).push(
                                  RouteGenerator.generateRoute(
                                      RouteSettings(name: DetailsScreen.id,arguments: [index,searchType.random])));
                              Provider.of<settings>(context, listen: false)
                                  .lastRecipes
                                  .add(Provider.of<SearchResult>(context,
                                          listen: false)
                                      .responseRandom[index]
                                      .id
                                      .toString());
                              Provider.of<SearchResult>(context, listen: false)
                                  .responseLastRecipes
                                  .add(Provider.of<SearchResult>(context,
                                          listen: false)
                                      .responseRandom[index]);
                              Data.storeLastRecipes(
                                  Provider.of<settings>(context, listen: false)
                                      .lastRecipes
                                      .toList());
                            },
                            child: MyCard(
                                url: Provider.of<SearchResult>(context,
                                        listen: false)
                                    .responseRandom[index]
                                    .image
                                    .toString(),
                                name: Provider.of<SearchResult>(context,
                                        listen: false)
                                    .responseRandom[index]
                                    .title,
                                minutes: Provider.of<SearchResult>(context,
                                        listen: false)
                                    .responseRandom[index]
                                    .minutes
                                    .toString(),
                                id: Provider.of<SearchResult>(context,
                                        listen: false)
                                    .responseRandom[index]
                                    .id
                                    .toString(),
                                height: constarins.maxHeight * 0.35,
                                width: constarins.maxWidth * 0.35),
                          );
                      },
                    ),
                  )
                : ConnectionProblem(
                    height: constarins.maxHeight * 0.35,
                    width: constarins.maxWidth - 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).YourLastRecipes,
                style: TextStyle(color: coordinate.red),
              ),
            ),
            Provider.of<SearchResult>(context, listen: false)
                        .responseLastRecipes
                        .length !=
                    0
                ? Container(
                    height: constarins.maxHeight * 0.35,
                    margin: EdgeInsets.only(right: constarins.maxWidth * 0.05),
                    child: ListView.builder(
                      itemCount:
                          Provider.of<SearchResult>(context, listen: false)
                              .responseLastRecipes
                              .length,
                      scrollDirection: Axis.horizontal,
                      cacheExtent: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            //navigation
                            Navigator.of(context).push(
                                RouteGenerator.generateRoute(
                                    RouteSettings(name: DetailsScreen.id,arguments: [index,searchType.lastRecipes])));
                          },
                          child: MyCard(
                              url: Provider.of<SearchResult>(context,
                                      listen: false)
                                  .responseLastRecipes
                                  .elementAt(index)
                                  .image
                                  .toString(),
                              name: Provider.of<SearchResult>(context,
                                      listen: false)
                                  .responseLastRecipes
                                  .elementAt(index)
                                  .title,
                              minutes: Provider.of<SearchResult>(context,
                                      listen: false)
                                  .responseLastRecipes
                                  .elementAt(index)
                                  .minutes
                                  .toString(),
                              id: Provider.of<SearchResult>(context,
                                      listen: false)
                                  .responseLastRecipes
                                  .elementAt(index)
                                  .id
                                  .toString(),
                              height: constarins.maxHeight * 0.35,
                              width: constarins.maxWidth * 0.35),
                        );
                      },
                    ),
                  )
                : ConnectionProblem(
                    height: constarins.maxHeight * 0.35,
                    width: constarins.maxWidth - 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).YourFavouriteRecipes,
                style: TextStyle(color: coordinate.red),
              ),
            ),
            Provider.of<SearchResult>(context, listen: false)
                        .responseFavourites
                        .length !=
                    0
                ? Container(
                    height: constarins.maxHeight * 0.35,
                    margin: EdgeInsets.only(right: constarins.maxWidth * 0.05),
                    child: ListView.builder(
                      itemCount:
                          Provider.of<SearchResult>(context, listen: true)
                              .responseFavourites
                              .length,
                      scrollDirection: Axis.horizontal,
                      cacheExtent: 2,
                      itemBuilder: (BuildContext context, int index) {
                        // add a condition to solve the problem because of unlove many recipes (work on index make it less than length)
                        return GestureDetector(
                          onTap: () {
                            //navigation
                            Navigator.of(context).push(
                                RouteGenerator.generateRoute(
                                    RouteSettings(name: DetailsScreen.id,arguments: [index,searchType.favourites])));
                            Provider.of<settings>(context, listen: false)
                                .lastRecipes
                                .add(Provider.of<SearchResult>(context,
                                        listen: false)
                                    .responseFavourites
                                    .elementAt(index)
                                    .id
                                    .toString());
                            Provider.of<SearchResult>(context, listen: false)
                                .responseLastRecipes
                                .add(Provider.of<SearchResult>(context,
                                        listen: false)
                                    .responseFavourites
                                    .elementAt(index));
                            Data.storeLastRecipes(
                                Provider.of<settings>(context, listen: false)
                                    .favourites
                                    .toList());
                          },
                          child: MyCard(
                              url: Provider.of<SearchResult>(context,
                                      listen: false)
                                  .responseFavourites
                                  .elementAt(index)
                                  .image
                                  .toString(),
                              name: Provider.of<SearchResult>(context,
                                      listen: false)
                                  .responseFavourites
                                  .elementAt(index)
                                  .title,
                              minutes: Provider.of<SearchResult>(context,
                                      listen: false)
                                  .responseFavourites
                                  .elementAt(index)
                                  .minutes
                                  .toString(),
                              id: Provider.of<SearchResult>(context,
                                      listen: false)
                                  .responseFavourites
                                  .elementAt(index)
                                  .id
                                  .toString(),
                              height: constarins.maxHeight * 0.35,
                              width: constarins.maxWidth * 0.35),
                        );
                      },
                    ),
                  )
                : ConnectionProblem(
                    height: constarins.maxHeight * 0.35,
                    width: constarins.maxWidth - 30),
          ]),
        );
      }),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        elevation: 0,
        backgroundColor: coordinate.blue,
        title: Text(
          S.of(context).Title,
          style: TextStyle(color: coordinate.red),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.account_circle_rounded),
              title: Text(S.of(context).Account),
              onTap: () {
                Navigator.of(context).push(RouteGenerator.generateRoute(
                    RouteSettings(name: AccountScreen.id)));
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text(S.of(context).Language),
              onTap: () {
                Navigator.of(context).push(RouteGenerator.generateRoute(
                    RouteSettings(name: LanguageScreen.id)));
              },
            ),
            ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text(S.of(context).Dark),
                trailing: Switch(
                  onChanged: (value) {
                    Provider.of<settings>(context, listen: false).changeTheme();
                  },
                  value: Provider.of<settings>(context).theme == ThemeMode.dark
                      ? true
                      : false,
                )),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(S.of(context).About),
              onTap: () {
                Alert(
                  context: context,
                  type: AlertType.info,
                  desc: S.of(context).Hint,
                  buttons: [
                    DialogButton(
                      child: Text(
                        S.of(context).OK,
                        style: TextStyle(color: coordinate.yalow, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                    )
                  ],
                ).show();
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(S.of(context).Logout),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
//drawer screens
