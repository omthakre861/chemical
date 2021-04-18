import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class webview extends StatefulWidget {
  @override
  _webviewState createState() => _webviewState();
}

class _webviewState extends State<webview> {
  InAppWebViewController _webViewController;
  String filePath = 'files/iindex.html';

  // final Dio dio = Dio();
  // bool loading = false;
  // double progress = 0;

  // Future<bool> saveGlb(String url, String fileName) async {
  //   Directory directory;
  //   try {
  //     if (Platform.isAndroid) {
  //       if (await _requestPermission(Permission.storage)) {
  //         directory = await getExternalStorageDirectory();
  //         String newPath = "";
  //         print(directory);
  //         List<String> paths = directory.path.split("/");
  //         for (int x = 1; x < paths.length; x++) {
  //           String folder = paths[x];
  //           if (folder != "Android") {
  //             newPath += "/" + folder;
  //           } else {
  //             break;
  //           }
  //         }
  //         newPath = newPath + "/Chemical/bin/glb";
  //         print(newPath);
  //         directory = Directory(newPath);
  //       } else {
  //         return false;
  //       }
  //     }
  //     File saveFile = File(directory.path + "/$fileName");
  //     if (!await directory.exists()) {
  //       await directory.create(recursive: true);
  //     }
  //     if (await directory.exists()) {
  //       await dio.download(url, saveFile.path,
  //           onReceiveProgress: (value1, value2) {
  //         setState(() {
  //           progress = value1 / value2;
  //         });
  //       });

  //       return true;
  //     }
  //     return false;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  // Future<bool> _requestPermission(Permission permission) async {
  //   if (await permission.isGranted) {
  //     return true;
  //   } else {
  //     var result = await permission.request();
  //     if (result == PermissionStatus.granted) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  // downloadFile() async {
  //   setState(() {
  //     loading = true;
  //     progress = 0;
  //   });
  //   bool downloaded =
  //       await saveGlb("http://10.0.2.2:8000/files/2244.glb", "2244.glb");
  //   if (downloaded) {
  //     print("File Downloaded");
  //   } else {
  //     print("Problem Downloading File");
  //   }
  //   setState(() {
  //     loading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InAppWebView(
          initialFile: filePath,
          // initialUrl: "https://www.google.com",

          // javascriptMode: JavascriptMode.unrestricted,

          onWebViewCreated: (InAppWebViewController webViewController) {
            _webViewController = webViewController;
            // _loadHtmlFromAssets();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.view_in_ar),
          onPressed: () {
            // downloadFile();
          },
        ));
  }

  // _loadHtmlFromAssets() async {
  //   String fileHtmlContents = await rootBundle.loadString(filePath);
  //   _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
  //           mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
  //       .toString());
  // }

}

class Download extends StatefulWidget {
  Download({Key key}) : super(key: key);

  @override
  _DownloadState createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.view_in_ar),
      onPressed: () {},
    );
  }
}
