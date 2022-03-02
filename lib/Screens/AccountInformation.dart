import 'package:finalproject/Screens/ChangeScreen.dart';
import 'package:finalproject/Utils/Informations.dart';
import 'package:finalproject/Servecis/Navigation.dart';
import 'package:finalproject/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/Utils/Coordinate.dart';

class AccountScreen extends StatefulWidget {
  static const String id = "AccountScreen";
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  GlobalKey<FormState> key = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: coordinate.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("lib/Assets/loginIcon.png"),
              radius: height * 0.1,
            ),
            Text(
              "${S.of(context).UserName} : ${Provider.of<settings>(context).userName}",
              style: TextStyle(color: coordinate.yalow),
            ),
            Text(
              "${S.of(context).FirstName} : ${Provider.of<settings>(context).firstName}",
              style: TextStyle(color: coordinate.yalow),
            ),
            Text(
              "${S.of(context).LastName} : ${Provider.of<settings>(context).lastName}",
              style: TextStyle(color: coordinate.yalow),
            ),
            Text(
              "${S.of(context).UserName} : ${Provider.of<settings>(context).userName}",
              style: TextStyle(color: coordinate.yalow),
            ),
            Text(
              "${S.of(context).EmailWord} : ${Provider.of<settings>(context).email}",
              style: TextStyle(color: coordinate.yalow),
            ),
            Text(
              "${S.of(context).GenerateCode} : ${Provider.of<settings>(context).generatedCode}",
              style: TextStyle(color: coordinate.yalow),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(RouteGenerator.generateRoute(
                      RouteSettings(name: ChangePassword.id)));
                },
                child: Text(
                  S.of(context).ChangeCode,
                  style: TextStyle(color: coordinate.red),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(coordinate.yalow)))
          ],
        ),
      ),
    );
  }
}
