import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecordController extends GetxController {

  late WebViewController webController;

  @override
  void onInit() {
    super.onInit();
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://mobile.51wnl-cq.com/huangli_tab_h5/?posId=BDSS&STIME='))
      ..setUserAgent("Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36 Edg/117.0.0.0")
      ..enableZoom(false)
      ..setNavigationDelegate(NavigationDelegate(
          // onPageFinished: (url) {
          //   webController.runJavaScript(
          //       "javascript:(function() { var head = document.querySelector('#app > div > div > div.wzbz_header');head.remove(head);var footer = document.querySelector('#app > div > div > div.tab_block');})()"
          //   );
          // }
      ));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
