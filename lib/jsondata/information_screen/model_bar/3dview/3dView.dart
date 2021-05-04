import 'dart:convert';
import 'dart:io';

import 'package:chemical/arcore/ar.dart';
import 'package:chemical/arcore/artemp.dart';
import 'package:chemical/jsondata/infoscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart'
    show ArCoreController;
import 'package:store_redirect/store_redirect.dart';

class webview extends StatefulWidget {
  @override
  _webviewState createState() => _webviewState();
}

class _webviewState extends State<webview>
    with AutomaticKeepAliveClientMixin<webview> {
  String cmp_id;

  @override
  void initState() {
    super.initState();
    cmp_id = ShowSearchAuto.comp.trim();
  }

  InAppWebViewController _webViewController;

  String filePath = 'files/index.html';

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
  //
  //
  _checkpermission_opencamera() async {
    var cameraStatus = await Permission.camera.status;

    print(cameraStatus);

    //cameraStatus.isGranted == has access to application
    //cameraStatus.isDenied == does not have access to application, you can request again for the permission.
    //cameraStatus.isPermanentlyDenied == does not have access to application, you cannot request again for the permission.
    //cameraStatus.isRestricted == because of security/parental control you cannot use this permission.
    //cameraStatus.isUndetermined == permission has not asked before.

    if (!cameraStatus.isGranted) await Permission.camera.request();

    if (await Permission.camera.isGranted) {
      return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ArView(),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          content: Text("Provide Camera permission to use camera.",
              style: TextStyle(
                  fontFamily: "Spotify",
                  fontWeight: FontWeight.w300,
                  fontSize: 20))));
    }
  }

  num position = 1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: IndexedStack(index: position, children: [
          InAppWebView(
            initialFile: filePath,

            initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
              horizontalScrollBarEnabled: false,
              verticalScrollBarEnabled: false,
              supportZoom: false,
            )),

            // initialUrl: "https://www.google.com",

            // javascriptMode: JavascriptMode.unrestricted,
            // onLoadStart: (controller, url) {

            //   _webViewController.enva
            // },
            onWebViewCreated: (InAppWebViewController webViewController) {
              _webViewController = webViewController;
              _webViewController.addJavaScriptHandler(
                  handlerName: 'handlerFoo',
                  callback: (args) {
                    return {'cidId': cmp_id};
                  });

              Future.delayed(Duration(seconds: 5), () {
                setState(() {
                  position = 0;
                });
              });
              // _loadHtmlFromAssets();
            },
            // onLoadStart: (controller, url) {
            //   setState(() {
            //     position = 1;
            //   });
            // },
            // onLoadStop: (controller, url) {
            //   setState(() {
            //     position = 0;
            //   });
            // },

            onConsoleMessage: (InAppWebViewController controller,
                ConsoleMessage consoleMessage) {
              print("console message: ${consoleMessage.message}");
            },
          ),
          Container(
            child: Center(
              child: Container(
                child: SpinKitFadingFour(
                  color: Colors.grey.shade500,
                  size: 80,
                ),
              ),
            ),
          )
        ]),
        floatingActionButton: FloatingActionButton(
          child: Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.view_in_ar,
              size: 30,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Color(0xff8E6BBF),
                Color(0xff003F63),
              ]),
            ),
          ),
          onPressed: () async {
            if (await ArCoreController.checkArCoreAvailability()) {
              if (await ArCoreController.checkIsArCoreInstalled()) {
                return _checkpermission_opencamera();
              } else {
                return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    action: SnackBarAction(
                      label: 'Install',
                      onPressed: () {
                        StoreRedirect.redirect(
                          androidAppId: "com.google.ar.core",
                        );
                      },
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    content: Text(
                        "Install ARCore Library for better experiences",
                        style: TextStyle(
                            fontFamily: "Spotify",
                            fontWeight: FontWeight.w300,
                            fontSize: 20))));
              }
            } else {
              return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  content: Text("This device doesn't support ARCore",
                      style: TextStyle(
                          fontFamily: "Spotify",
                          fontWeight: FontWeight.w300,
                          fontSize: 18))));
            }
          },
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  // _loadHtmlFromAssets() async {
  //   String fileHtmlContents = await rootBundle.loadString(filePath);
  //   _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
  //           mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
  //       .toString());
  // }

}
