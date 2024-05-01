import 'package:get/get.dart';
import '../../../common/common.dart';
import '../../../common/database.dart';

class MyController extends GetxController {
  //TODO: Implement MyController

  final count = 0.obs;
  List<BaZiItem> allItems = [];

  @override
  void onInit() {
    super.onInit();
    select();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  select() async {

    // await database.into(database.baZiItems).insert(BaZiItemsCompanion.insert(name: "name", gender: 1, notes: "notes", time: DateTime.now(), solarTime: DateTime.now(), timeZone: "timeZone", longitude: "longitude", latitude: "latitude"));

    allItems = await database.select(database.baZiItems).get();

    print('items in database: $allItems');

    // await database.delete(database.baZiItems).go();

  }

  add() async {

    await database.into(database.baZiItems).insert(BaZiItemsCompanion.insert(name: "name", gender: 1, notes: "notes", time: DateTime.now(), solarTime: DateTime.now(), timeZone: "timeZone", longitude: "longitude", latitude: "latitude"));

    allItems = await database.select(database.baZiItems).get();

    update();
    //
    // print('items in database: $allItems');

    // await database.delete(database.baZiItems).go();

  }

}
