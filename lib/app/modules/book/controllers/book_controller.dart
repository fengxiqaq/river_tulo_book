import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookController extends GetxController {

  //山 1 医 2 命理 3 相 4 卜 5
  var switchValue = 1.obs;
  Map fatherResults = {};
  List fatherData = [];

  PageController pageController = PageController();
  Map results = {};
  List data = [].obs;
  // int selectIndex = 0;

  late WebViewController webController;

  Map childResults = {};
  List childData = [].obs;

  @override
  void onInit() {
    super.onInit();
    getFartherData(4359960);
    // pageController.addListener(() {
    //   String type = "山";
    //   if(switchValue.value == 1){
    //     type = "山";
    //   }
    //   else if(switchValue.value== 2){
    //     type = "医";
    //   }
    //   else if(switchValue.value == 3){
    //     type = "命";
    //   }
    //   else if(switchValue.value == 4){
    //     type = "相";
    //   }
    //   else if(switchValue.value == 5){
    //     type = "卜";
    //     debugPrint("卜");
    //   }
    //   setData(type);
    //   // update();
    //   // switchValue.value = pageController.page!.toInt() + 1;
    //   debugPrint("childData:$data");
    // });
    // webController = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..loadRequest(Uri.parse(''))
    //   ..setUserAgent("Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36 Edg/117.0.0.0")
    //   ..enableZoom(false)
    //   ..setNavigationDelegate(NavigationDelegate(
    //     // onPageFinished: (url) {
    //     //   webController.runJavaScript(
    //     //       "javascript:(function() { var head = document.querySelector('#app > div > div > div.wzbz_header');head.remove(head);var footer = document.querySelector('#app > div > div > div.tab_block');})()"
    //     //   );
    //     // }
    //   ));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onSwitchValueChanged(value) {
    switchValue.value = value;
    // pageController.jumpToPage(value);
    // update();
    String type = "山";
    if(switchValue.value == 1){
      type = "山";
    }
    else if(switchValue.value== 2){
      type = "医";
    }
    else if(switchValue.value == 3){
      type = "命";
    }
    else if(switchValue.value == 4){
      type = "相";
    }
    else if(switchValue.value == 5){
      type = "卜";
      debugPrint("卜");
    }
    setData(type);
  }

  getData(parentFileId) async {
    var result = await dio.Dio().get("https://www.123pan.com/b/api/share/get?limit=100&next=-1&orderBy=file_name&orderDirection=asc&shareKey=HHynjv-NNc5d&ParentFileId=$parentFileId&Page=1&event=homeListFile&operateType=4");
    results = result.data["data"];
    data = results["InfoList"];
    debugPrint("getData:$data");
    setChildData(0);
    update();
  }

  getFartherData(parentFileId) async {
    var result = await dio.Dio().get("https://www.123pan.com/b/api/share/get?limit=100&next=-1&orderBy=file_name&orderDirection=asc&shareKey=HHynjv-NNc5d&ParentFileId=$parentFileId&Page=1&event=homeListFile&operateType=4");
    fatherResults = result.data["data"];
    fatherData = fatherResults["InfoList"];
    debugPrint("FatherData$fatherData");
    // update();

    setData("山");
  }

  setData(String type){
    for(var i = 0;i<fatherData.length;i++){
      if(fatherData[i]["FileName"] == type){
        var parentFileId = fatherData[i]["FileId"];
        getData(parentFileId);
      }
    }
  }

  setChildData(int type) async {
    var parentFileId = data[type]["FileId"];
    var result = await dio.Dio().get("https://www.123pan.com/b/api/share/get?limit=100&next=-1&orderBy=file_name&orderDirection=asc&shareKey=HHynjv-NNc5d&ParentFileId=$parentFileId&Page=1&event=homeListFile&operateType=4");
    childResults = result.data["data"];
    childData = childResults["InfoList"];
    debugPrint("getChildData:$childData");
    update();
  }

}
