import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class webview extends StatefulWidget {
  @override
  _webviewState createState() => _webviewState();
}

class _webviewState extends State<webview> {
  InAppWebViewController _webViewController;
  String filePath = 'files/iindex.html';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: InAppWebView(
        // initialFile: filePath,
        initialUrl: "https://www.google.com",
        
        // javascriptMode: JavascriptMode.unrestricted,
      

        onWebViewCreated: (InAppWebViewController webViewController) {
          _webViewController = webViewController;
          // _loadHtmlFromAssets();

        
        },
        
      ),
    );
  }

  // _loadHtmlFromAssets() async {
  //   String fileHtmlContents = await rootBundle.loadString(filePath);
  //   _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
  //           mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
  //       .toString());
  // }

}
