import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart';
import 'package:finalproject/Servecis/API.dart';

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late WebViewController controller;

  // Future<String> loadHtml() async {
  //   Widgets_Images w = Widgets_Images();
  //   final url = Uri.dataFromString(await w.getRecipeNutritionLabelWidget('641166'),
  //           mimeType: "text/html", encoding: Encoding.getByName("utf-8"))
  //       .toString();
  //   return url;
  // }

  Uint8List getImagenBase64(String imagen) {
    const Base64Codec base64 = Base64Codec();
    var bytes = base64.decode(imagen);
    print(bytes.length);
    return bytes;
  }

  Future<Uint8List> fetch2() async {
    var x = await get(
        Uri.tryParse(
            "https://api.spoonacular.com/recipes/1082038/priceBreakdownWidget.png?apiKey=97eb091891f34a37873cc4036ae0298b")!,
        headers: {"Accept": "image/png"});
       //List<int> z=utf8.encode(x.body);
       // print(z);
      //Uint8List bytes = Uint8List.fromList(z);
      //var b = Base64Decoder().convert(x.body);
     //  var by=getImagenBase64(Base64Codec().encode(z));
    var base64 = x.body.split(';base64,')[1];
    base64 = base64.replaceFirst('binary data/', '');
    Uint8List bytes = base64Decode(base64);

    if (x.statusCode == 200)
      return bytes;
    else
      throw new Exception("error in connect");
  }

  @override
  void initState() {
    // super.initState();
    // if (Platform.isAndroid) {
    //   WebView.platform = SurfaceAndroidWebView();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: fetch2().whenComplete(() => print("hello world")),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState ==ConnectionState.done && snapshot.hasData)
               {
                return Image.memory(snapshot.data);}
                // return WebView(
                //   javascriptMode: JavascriptMode.unrestricted,
                //   onWebViewCreated: (webcontroller) {
                //     controller = webcontroller;
                //     controller.loadUrl(snapshot.data);
                //   },
                // );
              else
                return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
