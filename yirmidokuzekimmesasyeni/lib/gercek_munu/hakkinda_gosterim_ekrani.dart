import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Hakkinda_Goster_web_wiv extends StatefulWidget {
  const Hakkinda_Goster_web_wiv({Key? key}) : super(key: key);

  @override
  State<Hakkinda_Goster_web_wiv> createState() =>
      _Hakkinda_Goster_web_wivState();
}

class _Hakkinda_Goster_web_wivState extends State<Hakkinda_Goster_web_wiv> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: WebView(
            initialUrl:
                'https://tr.wikipedia.org/wiki/29_Ekim_Cumhuriyet_Bayram%C4%B1',
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}
