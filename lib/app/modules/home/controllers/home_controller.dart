import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../provider/home_page_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  TextEditingController textEditingController = TextEditingController();
  UserProvider userProvider = UserProvider();


  Future<void> getImage()async {
   await userProvider.getImage(1);
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
}
