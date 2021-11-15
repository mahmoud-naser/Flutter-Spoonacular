// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// main() {
//   runApp(MyWidget());
// }
//
// class MyWidget extends StatefulWidget {
//   const MyWidget({Key? key}) : super(key: key);
//
//   @override
//   _MyWidgetState createState() => _MyWidgetState();
// }
//
// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: FutureBuilder(
//             builder: (context, snapshot) {
//               Response? x=snapshot.data as Response? ;
//               return jsonDecode(x!.body['results']['image']);
//             },
//             future: get(Uri.tryParse(
//                 "https://api.spoonacular.com/recipes/complexSearch?query=pasta&maxFat=25&number=1?apikey=58d6d02afe77496d8e39b90340c833b1")!).whenComplete((){setState(() {
//                   ;
//                 });}),
//           ),
//         ),
//       ),
//     );
//   }
// }