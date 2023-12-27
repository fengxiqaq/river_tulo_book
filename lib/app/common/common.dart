import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:river_tulo_book/app/data/app_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

SnackbarController buildSnackbar(String title,String context,SnackPosition position,EdgeInsets margin) {
  return Get.snackbar(title, context,snackPosition: position,margin: margin,colorText: AppColors.colorPrimary);
}

class CommonWebView extends StatefulWidget {

  String url;
  String title;

  CommonWebView(this.url, this.title);

  @override
  State<CommonWebView> createState() => _CommonWebViewState();
}

class _CommonWebViewState extends State<CommonWebView> {

  late WebViewController webController;
  int progress = 0;

  @override
  void initState() {
    super.initState();
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url))
      ..enableZoom(true)
      ..setNavigationDelegate(NavigationDelegate(
        // onPageFinished: (url) {
        //   webController.runJavaScript(
        //       "javascript:(function() { var head = document.querySelector('#app > div > div > div.wzbz_header');head.remove(head);var footer = document.querySelector('#app > div > div > div.tab_block');})()"
        //   );
        // }
          onWebResourceError: (e){
            buildSnackbar("网络异常！", "请退出重试！", SnackPosition.BOTTOM, EdgeInsets.only(left: 10.w,right: 10.w,bottom: 35.h));
          },
          onProgress: (int progress){
            debugPrint("$progress");
            setState(() {
              this.progress = progress;
            });
          }
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SafeArea(child: progress == 100 ? WebViewWidget(controller: webController) : const Center(child: CircularProgressIndicator())),
    );
  }

}