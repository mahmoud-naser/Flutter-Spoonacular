import 'dart:math';
import 'package:finalproject/Screens/LogScreen.dart';
import 'package:finalproject/Screens/MainScreen.dart';
import 'package:finalproject/Utils/Coordinate.dart';
import 'package:finalproject/Utils/Informations.dart';
import 'package:finalproject/Servecis/Navigation.dart';
import 'package:finalproject/Widgets/Text_Field.dart';
import 'package:finalproject/generated/l10n.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:finalproject/Servecis/DataPersitance.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String id = "RegisterScreen";
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  GlobalKey<FormState> key = GlobalKey<FormState>();
  var username_controller;
  var fname_controller;
  var lname_controller;
  var email_controller;
  var controllerpinput;
  bool vis = false;

  void initState() {
    username_controller = TextEditingController();
    fname_controller = TextEditingController();
    lname_controller = TextEditingController();
    email_controller = TextEditingController();
    controllerpinput = TextEditingController();
  }

  void dispose() {
    username_controller.dispose();
    fname_controller.dispose();
    lname_controller.dispose();
    email_controller.dispose();
    controllerpinput.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
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
                        fontFamily: coordinate.getFont(),
                        color: coordinate.yalow),
                  ),
                  Image.asset(
                    "lib/Assets/Animated_Pizza.gif",
                    height: 0.2 * height,
                    width: 0.5 * width,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Name(
                      controller: username_controller,
                      name: NameType.username2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Name(
                      controller: fname_controller,
                      name: NameType.firstname,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Name(
                      controller: lname_controller,
                      name: NameType.lastname,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Email(controller: email_controller),
                  ),
                  Visibility(
                    visible: vis,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PinPut(
                        mainAxisSize: MainAxisSize.max,
                        controller: controllerpinput,
                        textStyle: TextStyle(color: coordinate.yalow),
                        fieldsAlignment: MainAxisAlignment.spaceAround,
                        fieldsCount: 8,
                        followingFieldDecoration: BoxDecoration(
                          border:
                              Border.all(width: 2.0, color: coordinate.yalow),
                        ),
                        disabledDecoration: BoxDecoration(
                          border:
                              Border.all(width: 2.0, color: coordinate.yalow),
                        ),
                        submittedFieldDecoration: BoxDecoration(
                          border:
                              Border.all(width: 2.0, color: coordinate.yalow),
                        ),
                        selectedFieldDecoration: BoxDecoration(
                          border:
                              Border.all(width: 2.0, color: coordinate.yalow),
                        ),
                        onTap: () {
                          Alert(
                            context: context,
                            type: AlertType.warning,
                            title: S.of(context).CodeGeneration,
                            desc: S.of(context).ChangingCodeWarning,
                            buttons: [
                              DialogButton(
                                child: Text(
                                  S.of(context).OK,
                                  style: TextStyle(
                                      color: coordinate.yalow, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: width * 0.5,
                              )
                            ],
                          ).show();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              bool navigate = key.currentState!.validate();
                              if (navigate && vis) {
                                key.currentState!.save();
                                Data.storeUsername(username_controller.text);
                                Data.storeFirstName(fname_controller.text);
                                Data.storeLastName(lname_controller.text);
                                Data.storeEmail(email_controller.text);
                                Data.storeFirstTime(false);
                                print(Provider.of<settings>(context,
                                        listen: false)
                                    .generatedCode);
                                Provider.of<settings>(context, listen: false)
                                    .userName = username_controller.text;
                                Provider.of<settings>(context, listen: false)
                                    .firstName = fname_controller.text;
                                Provider.of<settings>(context, listen: false)
                                    .lastName = lname_controller.text;
                                Provider.of<settings>(context, listen: false)
                                    .email = email_controller.text;
                                bool b = false;
                                String str = "";
                                if (Provider.of<settings>(context,
                                            listen: false)
                                        .locale ==
                                    Locale("ar")) {
                                  String s = controllerpinput.text;
                                  for (int i = s.length - 1; i >= 0; i--)
                                    str += s[i];
                                  b = true;
                                }
                                Data.storeGeneratedCode(
                                    b == false ? controllerpinput.text : str);
                                Provider.of<settings>(context, listen: false)
                                    .changePassword(b == false
                                        ? controllerpinput.text
                                        : str);
                                Navigator.of(context).pushReplacement(
                                    RouteGenerator.generateRoute(
                                        RouteSettings(name: LoginScreen.id)));
                              } else if (!vis && navigate) {
                                Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: S.of(context).CodeGenerationError,
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        S.of(context).TryAgain,
                                        style: TextStyle(
                                            color: coordinate.red,
                                            fontSize: 20),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      width: width * 0.5,
                                    )
                                  ],
                                ).show();
                              }
                              //use api
                            },
                            child: Text(
                              S.of(context).RegisterWord,
                              style: TextStyle(color: coordinate.red),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    coordinate.yalow)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                Random r = new Random();
                                int val = r.nextInt(99999999);
                                String s = val.toString();
                                bool b = false;
                                String str = "";
                                if (Provider.of<settings>(context,
                                            listen: false)
                                        .locale ==
                                    Locale("ar")) {
                                  b = true;
                                  for (int i = s.length - 1; i >= 0; i--)
                                    str += s[i];
                                }
                                if (!b)
                                  controllerpinput.text = s;
                                else
                                  controllerpinput.text = str;
                                vis = true;
                              });
                              //use database
                            },
                            child: Text(
                              S.of(context).GenerateCode,
                              style: TextStyle(color: coordinate.red),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    coordinate.yalow)),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
