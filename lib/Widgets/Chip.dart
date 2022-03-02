import 'package:finalproject/Servecis/API.dart';
import 'package:finalproject/Utils/Coordinate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyChip extends StatefulWidget {
  String title;
  bool selected = false;
  MyChip({Key? key, required this.title}) : super(key: key);

  @override
  _MyChipState createState() => _MyChipState();
}

class _MyChipState extends State<MyChip> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selectedColor: coordinate.red,
      label: Text(
        "${widget.title}",
        style: TextStyle(color: coordinate.blue),
      ),
      onSelected: (select) {
        setState(() {
          widget.selected = select;
          if (select==false) {
            Provider.of<SearchResult>(context, listen: false).getRecipe(
                searchType.findByIngredients,
                ingredients: ['fruits']);
          } else {
            Provider.of<SearchResult>(context, listen: false).getRecipe(
                searchType.findByIngredients,
                ingredients: [widget.title.toLowerCase()]);
          }
          //api
        });
        /*use api to get search*/
      },
      selected: widget.selected,
    );
  }
}
