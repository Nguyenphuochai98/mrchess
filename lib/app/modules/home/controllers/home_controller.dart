import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mrchess/app/routes/app_pages.dart';

import '../provider/home_page_provider.dart';
import '../provider/item_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  TextEditingController textEditingController = TextEditingController();
  UserProvider userProvider = UserProvider();
  Rx<ProductResponse?> data = ProductResponse(
    data: []
  ).obs;
  RxBool isLoading = false.obs;


  Future<void> getImage()async {
    isLoading.value = true;
    XFile file =await Get.toNamed(Routes.TAKEPHOTO);
    Uint8List bytes = await file.readAsBytes();
    ProductResponse? dataResponse = await userProvider.getImage(bytes);
    data.value = dataResponse;
    isLoading.value = false;
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
