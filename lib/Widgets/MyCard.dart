import 'package:finalproject/Servecis/API.dart';
import 'package:finalproject/Utils/Coordinate.dart';
import 'package:finalproject/Utils/Informations.dart';
import 'package:finalproject/Widgets/NoInternet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:finalproject/Servecis/DataPersitance.dart';

class MyCard extends StatefulWidget {
  String url;
  String name;
  String? minutes = null;
  String id;
  double height;
  double width;
  MyCard(
      {Key? key,
      required this.url,
      required this.name,
      required this.id,
      this.minutes,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: FadeInImage(
        imageErrorBuilder: (context, object, stack) {
          return ConnectionProblem(height: widget.height, width: widget.width);
        },
        image: NetworkImage(widget.url),
        placeholder: AssetImage("lib/Assets/foodline.gif"),
      ).blurred(
        colorOpacity: 0.2,
        alignment: Alignment.topCenter,
        blur: 0.5,
        overlay: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${widget.name}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 5,
              ),
              Visibility(
                  child: Text('minutes : ${widget.minutes} ',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w900)),
                  visible: widget.minutes == null ||
                          widget.minutes == 0.toString() ||
                          widget.minutes == null.toString()
                      ? false
                      : true),
              LikeButton(
                isLiked: Provider.of<settings>(context, listen: false)
                        .favourites
                        .contains(widget.id)
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
                      .contains(widget.id)) {
                    Provider.of<settings>(context, listen: false)
                        .favourites
                        .add(widget.id);
                    Provider.of<SearchResult>(context, listen: false)
                        .responseFavourites
                        .add(Recipe(searchType.favourites,
                            int.tryParse(widget.id)!, widget.name,
                            image: Uri.tryParse(widget.url),
                            minutes: widget.minutes != null
                                ? int.parse(widget.minutes!)
                                : 0));
                    Data.storeFavourites(
                        Provider.of<settings>(context, listen: false)
                            .favourites
                            .toList());
                  } else {
                    Provider.of<settings>(context, listen: false)
                        .favourites
                        .remove(widget.id);
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
                            .contains(widget.id)
                        ? Icons.favorite_outlined
                        : Icons.favorite_border,
                    color: Provider.of<settings>(context, listen: false)
                            .favourites
                            .contains(widget.id)
                        ? coordinate.red
                        : coordinate.orange,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// onTap: (bool tapped) {
//     if (!Provider.of<settings>(context, listen: false)
//         .favourites
//         .contains(widget.id)) {
//       Provider.of<settings>(context, listen: false)
//           .favourites
//           .add(widget.id);
//       Provider.of<SearchResult>(context, listen: false)
//           .responseFavourites
//           .add(Recipe(searchType.favourites,
//               int.tryParse(widget.id)!, widget.name,
//               image: Uri.tryParse(widget.url),
//               minutes: widget.minutes != null
//                   ? int.parse(widget.minutes!)
//                   : 0));
//       Data.storeFavourites(
//           Provider.of<settings>(context, listen: false)
//               .favourites
//               .toList());
//     } else {
//       Provider.of<settings>(context, listen: false)
//           .favourites
//           .remove(widget.id);
//       Data.storeFavourites(
//           Provider.of<settings>(context, listen: false)
//               .favourites
//               .toList());
//     }
//   return Future.sync(() {
//     return tapped;
//   });
// },
