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
  RxBool isLoading = false.obs;
  Rx<List<Uint8List>> scans = Rx<List<Uint8List>>([]);
  Rx<List<Product>?> dataResponseHistory = Rx<List<Product>?>(null);

  Future<void> getImage()async {
    isLoading.value = true;
    XFile file =await Get.toNamed(Routes.TAKE_PHOTO);
    Uint8List bytes = await file.readAsBytes();
    ProductResponse? dataResponse = await userProvider.getImage(bytes);
    if(dataResponse != null && dataResponse.data.isNotEmpty){
      userProvider.saveScans(bytes);
      scans.value = await userProvider.getScans();
      await Get.toNamed(Routes.SEARCH_RESULT,arguments: dataResponse);
    }
    isLoading.value = false;
  }

  Future<void> findImage(Uint8List data)async {
    isLoading.value = true;
    ProductResponse? dataResponse = await userProvider.getImage(data);
    if(dataResponse != null){
      scans.value = await userProvider.getScans();
      await Get.toNamed(Routes.SEARCH_RESULT,arguments: dataResponse);
    }
    isLoading.value = false;
  }



  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    scans.value = await userProvider.getScans();
    dataResponseHistory.value = await userProvider.getProductResponseHistory();
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
