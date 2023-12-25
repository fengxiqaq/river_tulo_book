import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BookController extends GetxController {

  //山 1 医 2 命理 3 相 4 卜 5
  var switchValue = 1.obs;
  Map results = {};
  List data = [];

  @override
  void onInit() {
    super.onInit();
    getData(4359960);
    // setData();
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
  }

  getData(parentFileId) async {
    var result = await dio.Dio().get("https://www.123pan.com/b/api/share/get?limit=100&next=-1&orderBy=file_name&orderDirection=asc&shareKey=HHynjv-NNc5d&ParentFileId=$parentFileId&Page=1&event=homeListFile&operateType=4");
    results = result.data["data"];
    data = results["InfoList"];
    debugPrint(data.toString());
    update();
  }

  setData(String type){
    for(var i = 0;i<data.length;i++){
      if(data[i]["FileName"] == type){
        var parentFileId = data[i]["FileId"];
        getData(parentFileId);
      }
    }
  }

}
