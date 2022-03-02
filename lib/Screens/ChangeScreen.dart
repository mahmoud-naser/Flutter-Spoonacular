import 'dart:math';
import 'package:finalproject/Utils/Coordinate.dart';
import 'package:finalproject/Utils/Informations.dart';
import 'package:finalproject/generated/l10n.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:finalproject/Servecis/DataPersitance.dart';

class ChangePassword extends StatefulWidget {
  static const String id = "ChangeScreen";
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  var controllerpinput;
  bool vis = false;
  void initState() {
    controllerpinput = TextEditingController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: coordinate.blue,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).OldCode,
                style: TextStyle(color: coordinate.yalow),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PinPut(
                  onSubmit: (text) {
                    if (text ==
                        Provider.of<settings>(context, listen: false)
                            .generatedCode)
                      setState(() {
                        Random r = new Random();
                        int val = r.nextInt(99999999);
                        String s = val.toString();
                        if (s.length < 8) s += "0";
                        bool b = false;
                        String str = "";
                        if (Provider.of<settings>(context, listen: false)
                                .locale ==
                            Locale("ar")) {
                          b = true;
                          for (int i = s.length - 1; i >= 0; i--) str += s[i];
                        }
                        if (!b)
                          controllerpinput.text = s;
                        else
                          controllerpinput.text = str;
                        vis = true;
                      });
                  },
                  mainAxisSize: MainAxisSize.max,
                  textStyle: TextStyle(color: coordinate.yalow),
                  fieldsAlignment: MainAxisAlignment.spaceAround,
                  disabledDecoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: coordinate.yalow),
                  ),
                  fieldsCount: 8,
                  submittedFieldDecoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: coordinate.yalow),
                  ),
                  followingFieldDecoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: coordinate.yalow),
                  ),
                  selectedFieldDecoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: coordinate.yalow),
                  )),
            ),
            Visibility(
              visible: vis,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      S.of(context).NewCode,
                      style: TextStyle(color: coordinate.yalow),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PinPut(
                      withCursor: true,
                      mainAxisSize: MainAxisSize.max,
                      controller: controllerpinput,
                      textStyle: TextStyle(color: coordinate.yalow),
                      fieldsAlignment: MainAxisAlignment.spaceAround,
                      fieldsCount: 8,
                      disabledDecoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: coordinate.yalow),
                      ),
                      submittedFieldDecoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: coordinate.yalow),
                      ),
                      followingFieldDecoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: coordinate.yalow),
                      ),
                      selectedFieldDecoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: coordinate.yalow),
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
                              width: 120,
                            )
                          ],
                        ).show();
                      },
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  bool b = false;
                  String str = "";
                  if (Provider.of<settings>(context, listen: false).locale ==
                      Locale("ar")) {
                    String s = controllerpinput.text;
                    for (int i = s.length - 1; i >= 0; i--) str += s[i];
                    b = true;
                  }
                  Data.storeGeneratedCode(
                      b == false ? controllerpinput.text : str);
                  Provider.of<settings>(context, listen: false)
                      .changePassword(b == false ? controllerpinput.text : str);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${S.of(context).ChangeCodeMassage}")));
                },
                child: Text(
                  S.of(context).Confirm,
                  style: TextStyle(color: coordinate.red),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(coordinate.yalow)))
          ],
        )));
  }
}
