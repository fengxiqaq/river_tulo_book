import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ziwei_controller.dart';

class ZiweiView extends GetView<ZiweiController> {
  const ZiweiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZiweiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ZiweiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
