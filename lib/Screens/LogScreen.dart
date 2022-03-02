import 'package:finalproject/Screens/MainScreen.dart';
import 'package:finalproject/Screens/RegScreen.dart';
import 'package:finalproject/Servecis/Navigation.dart';
import 'package:finalproject/Utils/Informations.dart';
import 'package:finalproject/Widgets/Text_Field.dart';
import 'package:finalproject/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/Utils/Coordinate.dart';
import 'ForgetScreen.dart';
import 'package:provider/provider.dart';
import 'package:finalproject/Servecis/DataPersitance.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "LoginScreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  var username_controller;
  var password_controller;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  void initState() {
    username_controller = TextEditingController();
    password_controller = TextEditingController();
    if (Provider.of<settings>(context, listen: false).rememberMe == true) {
      username_controller.text =
          Provider.of<settings>(context, listen: false).userName;
      password_controller.text =
          Provider.of<settings>(context, listen: false).generatedCode;
    }
  }

  void dispose() {
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    bool valuee = Provider.of<settings>(context, listen: false).rememberMe;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: coordinate.blue,
      body: Center(
        child: Form(
          key: key,
          autovalidateMode: AutovalidateMode.disabled,
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).Title,
                style: TextStyle(
                    fontFamily: coordinate.getFont(), color: coordinate.yalow),
              ),
              Image.asset(
                "lib/Assets/Animated_Burger.gif",
                height: 0.2 * height,
                width: 0.5 * width,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Name(
                  controller: username_controller,
                  name: NameType.username,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Password(controller: password_controller),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    RouteGenerator.generateRoute(RouteSettings(
                                        name: RegisterScreen.id)));
                              },
                              child: Text(
                                S.of(context).NoAccount,
                                style: TextStyle(color: coordinate.yalow),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    RouteGenerator.generateRoute(RouteSettings(
                                        name: ForgetPassword.id)));
                              },
                              child: Text(
                                S.of(context).ForgetGeneratedCode,
                                style: TextStyle(color: coordinate.yalow),
                              )),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: width*0.075,),
                          Checkbox(
                              checkColor: coordinate.yalow,
                              activeColor: coordinate.yalow,
                              fillColor: MaterialStateProperty.all(
                                  coordinate.yalow),
                              value: Provider.of<settings>(context,
                                  listen: false)
                                  .rememberMe,
                              onChanged: (val) {
                                setState(() {
                                  Provider.of<settings>(context,
                                      listen: false)
                                      .rememberMe = val!;
                                });
                              }),
                          Text(
                            "${S.of(context).RememberMe}",
                            style: TextStyle(color: coordinate.yalow),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.05, horizontal: width * 0.05),
                        child: ElevatedButton(
                          onPressed: () {
                            bool navigate = key.currentState!.validate();
                            if (navigate) {
                              Data.storeRememberMe(valuee);
                              Navigator.of(context).pushReplacement(
                                  RouteGenerator.generateRoute(
                                      RouteSettings(name: Screen.id)));
                            }
                            //use api
                          },
                          child: Text(
                            S.of(context).LoginWord,
                            style: TextStyle(color: coordinate.red),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(coordinate.yalow)),
                        ),
                      )
                    ]),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
