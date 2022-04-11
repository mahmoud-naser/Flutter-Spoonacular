import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

enum searchType {
  complexSearch,
  findByIngredients,
  similar,
  random,
  autocomplete,
  favourites,
  lastRecipes
}
enum Constrains {
  includeIngredients,
  excludeIngredients,
  maxReadyTime,
  Carbs,
  Protein,
  Calories,
  Fat,
  Alcohol,
  Caffeine,
  Copper,
  Calcium,
  Cholesterol,
  VitaminA,
  VitaminB,
  VitaminD,
  VitaminE,
  VitaminK,
  VitaminB1,
  VitaminB2,
  VitaminB3,
  VitaminB5,
  VitaminB6,
  VitaminB12,
  Iron,
  Magnesium,
  Manganese,
  Phosphorus,
  Potassium,
  Sodium,
  SugarZinc
}
enum recipeType {
  mainCourse,
  sideDish,
  dessert,
  appetizer,
  salad,
  bread,
  breakfast,
  soup,
  beverage,
  sauce,
  marinade,
  fingerFood,
  snack,
  drink
}

class Recipe {
  late searchType type;
  late int id;
  late String title;
  bool? isFavourite = false;
  Uri? image;
  int? minutes;
  Uri? readMore;

  Recipe(this.type, this.id, this.title,
      {this.image, this.minutes, this.readMore});
  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if (other.runtimeType == Recipe)
      return this.id == (other as Recipe).id;
    else
      return false;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => this.id;
}

class SearchResult with ChangeNotifier {
  SearchResult() {}
  List<Recipe> responseRandom = [];
  List<Recipe> responseComplex = [];
  List<Recipe> responseSimilar = [];
  List<Recipe> responseAuto = [];
  List<Recipe> responseIngredients = [];
  Set<Recipe> responseFavourites = {};
  Set<Recipe> responseLastRecipes = {};

  void getRecipes(List j, searchType t) {
    switch (t) {
      case searchType.complexSearch:
        {
          j.forEach((element) {
            responseComplex.add(Recipe(t, element['id'], element['title'],
                image: Uri.tryParse(element['image'])));
          });
          break;
        }
      case searchType.favourites:
        {
          j.forEach((element) {
            responseFavourites.add(Recipe(t, element['id'], element['title'],
                image: Uri.tryParse(element['image']),
                minutes: element['readyInMinutes']));
          });
          break;
        }
      case searchType.lastRecipes:
        {
          j.forEach((element) {
            responseLastRecipes.add(Recipe(t, element['id'], element['title'],
                image: Uri.tryParse(element['image']),
                minutes: element['readyInMinutes']));
          });
          break;
        }
      case searchType.random:
        {
          j.forEach((element) {
            responseRandom.add(Recipe(t, element['id'], element['title'],
                image: Uri.tryParse(element['image']),
                minutes: element['readyInMinutes']));
          });
          break;
        }
      case searchType.similar:
        {
          j.forEach((element) {
            responseSimilar.add(Recipe(t, element['id'], element['title'],
                minutes: element['readyInMinutes']));
          });
          break;
        }
      case searchType.autocomplete:
        {
          j.forEach((element) {
            responseAuto.add(Recipe(t, element['id'], element['title']));
          });
          break;
        }
      case searchType.findByIngredients:
        {
          j.forEach((element) {
            responseIngredients.add(Recipe(t, element['id'], element['title'],
                image: Uri.tryParse(element['image'])));
          });
          break;
        }
    }
    return;
  }

  Future<void> getRecipe(searchType type,
      {String? id,
      String? name,
      Map<Constrains, dynamic>? constrains,
      int? number,
      List<String>? ingredients}) async {
    var x;
    if (type == searchType.complexSearch) {
      String cons = '';
      constrains!.forEach((key, value) {
        cons += '&';
        cons += 'max';
        cons += key.toString().replaceAll('Constrains.', '');
        cons += '=';
        cons += value.toString();
      });
      x = await get(
        Uri.tryParse(
            "https://api.spoonacular.com/recipes/complexSearch?apiKey=97eb091891f34a37873cc4036ae0298b&query=$name$cons&number=100")!,
      );
      var r = jsonDecode(x.body);
      if (x.statusCode == 200)
        getRecipes(r['results'], searchType.complexSearch);
      else {
        print(x.statusCode);
        throw new Exception("error in connect");
      }
      return;
    } else if (type == searchType.similar) {
      x = await get(Uri.tryParse(
          "https://api.spoonacular.com/recipes/$id/similar?apiKey=97eb091891f34a37873cc4036ae0298b")!);
      var r = jsonDecode(x.body);
      if (x.statusCode == 200)
        getRecipes(r, searchType.similar);
      else
        throw new Exception("error in connect");
      return;
    } else if (type == searchType.autocomplete) {
      x = await get(Uri.tryParse(
          "https://api.spoonacular.com/recipes/autocomplete?apiKey=97eb091891f34a37873cc4036ae0298b&number=25&query=$name")!);
      var r = jsonDecode(x.body);
      if (x.statusCode == 200)
        getRecipes(r, searchType.autocomplete);
      else
        throw new Exception("error in connect");
      return;
    } else if (type == searchType.findByIngredients) {
      String ingred = '';
      int i = 0;
      ingredients!.forEach((element) {
        i++;
        ingred += element.toString();
        if (i != ingredients.length) {
          ingred += ',';
          ingred += '+';
        }
      });
      x = await get(Uri.tryParse(
          "https://api.spoonacular.com/recipes/findByIngredients?apiKey=97eb091891f34a37873cc4036ae0298b&ingredients=$ingred&number=100&query=$name")!);
      var r = jsonDecode(x.body);
      if (x.statusCode == 200)
        getRecipes(r, searchType.findByIngredients);
      else
        throw new Exception("error in connect");
      return;
    } else if (type == searchType.favourites ||
        type == searchType.lastRecipes) {
      searchType t = type;
      x = await get(Uri.tryParse(
          "https://api.spoonacular.com/recipes/$id/information?apiKey=97eb091891f34a37873cc4036ae0298b&includeNutrition=false")!);
      var r = jsonDecode(x.body);
      if (x.statusCode == 200)
        getRecipes([r], t);
      else
        throw new Exception("error in connect");
      return;
    } else {
      x = await get(Uri.tryParse(
          "https://api.spoonacular.com/recipes/random?apiKey=97eb091891f34a37873cc4036ae0298b&number=100")!);
      var r = jsonDecode(x.body);
      if (x.statusCode == 200)
        getRecipes(r['recipes'], searchType.random);
      else
        throw new Exception("error in connect");
      return;
    }
  }
}

class Widgets {
  Widgets() {}

  Future<String> getEquipmentWidget(String id) async {
    var x = await get(
        Uri.tryParse(
            "https://api.spoonacular.com/recipes/$id/equipmentWidget?apiKey=97eb091891f34a37873cc4036ae0298b&defaultCss=true")!,
        headers: {"Accept": "text/html"});
    RegExp reg1 = RegExp(
        r'(<div+[\s\S]+input+[\s\S]+<\/div>)\B(?=(<div id=spoonacular-equipment-vis-grid>))',
        multiLine: true,
        unicode: true);
    RegExp reg2 = RegExp(r'((<div+\s\S+>)+((Widget by+[\s\S]+<\/div>)))',
        multiLine: true, unicode: true);
    String s = x.body.toString();
    String z = s
        .replaceAll(reg2.stringMatch(s)!, '')
        .replaceAll(reg1.stringMatch(s)!, '');
    if (x.statusCode == 200)
      return z;
    else
      throw new Exception("error in connect");
  }

  Future<String> getRecipeNutritionWidget(String id) async {
    var x = await get(
        Uri.tryParse(
            "https://api.spoonacular.com/recipes/$id/nutritionWidget?apiKey=97eb091891f34a37873cc4036ae0298b&defaultCss=true")!,
        headers: {"Accept": "text/html"});
    RegExp reg2 = RegExp(r'((<div+\s\S+>)+((Widget by+[\s\S]+<\/div>)))',
        multiLine: true, unicode: true);
    String s = x.body.toString();
    String z = s.replaceAll(reg2.stringMatch(s)!, '');
    if (x.statusCode == 200)
      return z;
    else
      throw new Exception("error in connect");
  }

  Future<String> getRecipeNutritionLabelWidget(String id) async {
    var x = await get(
        Uri.tryParse(
            "https://api.spoonacular.com/recipes/$id/nutritionLabel?apiKey=97eb091891f34a37873cc4036ae0298b&defaultCss=true")!,
        headers: {"Accept": "text/html"});
    if (x.statusCode == 200)
      return x.body.toString();
    else
      throw new Exception("error in connect");
  }

  Future<String> getProductNutritionWidget(String id) async {
    var x = await get(
        Uri.tryParse(
            "https://api.spoonacular.com/food/products/$id/nutritionWidget?apiKey=97eb091891f34a37873cc4036ae0298b&defaultCss=true")!,
        headers: {"Accept": "text/html"});
    if (x.statusCode == 200)
      return x.body.toString();
    else
      throw new Exception("error in connect");
  }

  Future<String> getProductNutritionLabelWidget(String id) async {
    var x = await get(
        Uri.tryParse(
            "https://api.spoonacular.com/food/products/$id/nutritionLabel?apiKey=97eb091891f34a37873cc4036ae0298b&defaultCss=true")!,
        headers: {"Accept": "text/html"});
    if (x.statusCode == 200)
      return x.body.toString();
    else
      throw new Exception("error in connect");
  }
}

//get menuItems
//get meal planning
//search all foods
//search food videos
//question and answer
//show image size
//connect user

//97eb091891f34a37873cc4036ae0298b
//779dddc6d2ba4cc782842ebf37780e42
//58d6d02afe77496d8e39b90340c833b1
//2fb0fc0e476f4861bdb1ba01b7ecf33d
