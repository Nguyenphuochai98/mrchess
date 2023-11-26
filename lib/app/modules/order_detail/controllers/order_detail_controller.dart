import 'package:get/get.dart';
import 'package:mrchess/app/modules/home/provider/item_model.dart';

import '../../home/provider/home_page_provider.dart';

class OrderDetailController extends GetxController {
  //TODO: Implement OrderDetailController
  UserProvider userProvider = UserProvider();
  Rx<ProductResponse?> recommandation = Rx<ProductResponse?>(null);
  RxBool isLoading = false.obs;
  late Product product;
  late int per;
  late double perTotal;

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading.value = true;
    product = Get.arguments[0] as Product;
    per = Get.arguments[1] as int;
    perTotal = Get.arguments[2] as double;
    recommandation.value =
        await userProvider.getRecommandation(product.name ?? '');
    isLoading.value = false;
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
