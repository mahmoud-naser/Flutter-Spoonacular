import 'package:finalproject/Utils/Coordinate.dart';
import 'package:finalproject/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class ConnectionProblem extends StatelessWidget {
  double height;
  double width;
  ConnectionProblem({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      color: coordinate.red,
      child: Text(
        S.of(context).NoInternet,
        style: TextStyle(color: coordinate.orange),
      ),
    );
  }
}
