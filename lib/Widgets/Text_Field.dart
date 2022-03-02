import 'package:finalproject/Utils/Coordinate.dart';
import 'package:finalproject/Utils/Informations.dart';
import 'package:finalproject/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:provider/provider.dart';

class Email extends StatefulWidget {
  TextEditingController controller;
  Email({Key? key, required this.controller}) : super(key: key);
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr,
      controller: widget.controller,
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          color: coordinate.yalow,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: coordinate.yalow)),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: coordinate.yalow)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: coordinate.yalow)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: coordinate.red)),
        labelText: S.of(context).EmailWord,
        labelStyle: TextStyle(color: coordinate.yalow),
        hintText: S.of(context).EmailPhrase1,
        hintStyle: TextStyle(color: coordinate.yalow),
        contentPadding: EdgeInsets.all(25),
      ),
      textAlign: TextAlign.center,
      showCursor: true,
      cursorColor: coordinate.yalow,
      validator: (content) {
        if (content == "")
          return S.of(context).RequiredWord;
        else if (!content!.isEmail()) return S.of(context).EmailPhrase2;
      },
    );
  }
}

class Password extends StatefulWidget {
  TextEditingController controller;
  Password({Key? key, required this.controller}) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr,
      controller: widget.controller,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(
          Icons.password,
          color: coordinate.yalow,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: coordinate.yalow)),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: coordinate.yalow)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: coordinate.yalow)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: coordinate.red)),
        labelText: S.of(context).Password,
        hintText: S.of(context).PasswordPhrase1,
        labelStyle: TextStyle(color: coordinate.yalow),
        hintStyle: TextStyle(color: coordinate.yalow),
        contentPadding: EdgeInsets.all(25),
      ),
      textAlign: TextAlign.center,
      showCursor: true,
      cursorColor: coordinate.yalow,
      validator: (content) {
        if (content == "")
          return S.of(context).RequiredWord;
        else if (content !=
            Provider.of<settings>(context, listen: false).generatedCode)
          return S.of(context).PasswordError;
        //compare with database
      },
    );
  }
}

enum NameType { username, firstname, lastname, username2 }

class Name extends StatefulWidget {
  TextEditingController controller;
  NameType name;
  Name({Key? key, required this.controller, required this.name})
      : super(key: key);

  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr,
      controller: widget.controller,
      decoration: InputDecoration(
        icon: Icon(
          Icons.person,
          color: coordinate.yalow,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: coordinate.yalow)),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: coordinate.yalow)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: coordinate.yalow)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: coordinate.red)),
        labelText: (widget.name == NameType.username ||
                widget.name == NameType.username2)
            ? S.of(context).UserName
            : (widget.name == NameType.firstname
                ? S.of(context).FirstName
                : S.of(context).LastName),
        hintText: (widget.name == NameType.username ||
                widget.name == NameType.username2)
            ? S.of(context).UserNamePhrase1
            : (widget.name == NameType.firstname
                ? S.of(context).FirstNamePhrase
                : S.of(context).LastNamePhrase),
        labelStyle: TextStyle(color: coordinate.yalow),
        hintStyle: TextStyle(color: coordinate.yalow),
        contentPadding: EdgeInsets.all(25),
      ),
      textAlign: TextAlign.center,
      showCursor: true,
      cursorColor: coordinate.yalow,
      validator: (content) {
        if (content == "")
          return S.of(context).RequiredWord;
        else if (!content!.isUsername() &&
            (widget.name == NameType.username ||
                widget.name == NameType.username2))
          return S.of(context).UserNamePhrase2;
        else if (widget.name == NameType.username &&
            Provider.of<settings>(context, listen: false).userName != content)
          return S.of(context).UserNameError;
      },
    );
  }
}
