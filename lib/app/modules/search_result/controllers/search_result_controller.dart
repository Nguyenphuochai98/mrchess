import 'dart:math';

import 'package:get/get.dart';
import 'package:mrchess/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart' as intl;
import '../../home/provider/home_page_provider.dart';
import '../../home/provider/item_model.dart';

class SearchResultController extends GetxController {

  Rx<ProductResponse?> dataResponse =  Rx<ProductResponse?>(null);

  Set<String> dataSetResponse = Set<String>();
  UserProvider userProvider = UserProvider();
  String formatRevenue = '';

  @override
  void onInit() {
    super.onInit();
    dataResponse.value = Get.arguments as ProductResponse?;
  }

  Future<void> onItemClicked(Product product,int per,double perTotal)async{
    final Uri url = Uri.parse(product.link!);
    if (!await launchUrl(url,mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }else{
      userProvider.saveHistory(product);
      Get.toNamed(Routes.ORDER_DETAIL,arguments: [product,per,perTotal]);
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
