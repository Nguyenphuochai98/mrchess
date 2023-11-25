import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home/provider/item_model.dart';

class SearchResultController extends GetxController {

  Rx<ProductResponse?> dataResponse =  Rx<ProductResponse?>(null);

  @override
  void onInit() {
    super.onInit();
    dataResponse.value = Get.arguments as ProductResponse?;
  }

  Future<void> onItemClicked(Product product)async{
    final Uri url = Uri.parse(product.link);
    if (!await launchUrl(url,mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
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
