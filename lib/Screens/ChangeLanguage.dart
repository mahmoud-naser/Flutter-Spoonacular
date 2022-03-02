import 'package:finalproject/Utils/Coordinate.dart';
import 'package:finalproject/Utils/Informations.dart';
import 'package:finalproject/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/Servecis/DataPersitance.dart';

class LanguageScreen extends StatelessWidget {
  static const String id = "LanguageScreen";
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coordinate.blue,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
                label: Text(S.of(context).Spanish,
                    style: TextStyle(color: coordinate.red)),
                onPressed: () {
                  Provider.of<settings>(context, listen: false)
                      .changeLanguage(Language.es);
                  Data.storeLanguage("Spanish");
                  S.load(Locale("es", "ESP"));
                }),
            ActionChip(
                backgroundColor: coordinate.yalow,
                label: Text(S.of(context).arabic,
                    style: TextStyle(color: coordinate.red)),
                onPressed: () {
                  Provider.of<settings>(context, listen: false)
                      .changeLanguage(Language.ar);
                  Data.storeLanguage("Arabic");
                  S.load(Locale("ar", "AR"));
                })
          ],
        ),
      ),
    );
  }
}
