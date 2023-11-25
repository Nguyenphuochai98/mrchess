import 'package:get/get.dart';
import 'package:mrchess/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart' as intl;
import '../../home/provider/item_model.dart';

class SearchResultController extends GetxController {

  Rx<ProductResponse?> dataResponse =  Rx<ProductResponse?>(null);



  String formatRevenue = '';

  @override
  void onInit() {
    super.onInit();
    dataResponse.value = Get.arguments as ProductResponse?;
  }



  Future<void> onItemClicked(Product product)async{
    final Uri url = Uri.parse(product.link);
    if (!await launchUrl(url,mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }else{
      Get.toNamed(Routes.ORDER_DETAIL,arguments: product);
    }
  }

  String formatterRevenue(int totalRevenue) {
    final formatter = intl.NumberFormat.currency(
        locale: 'vi_VN', decimalDigits: 0, symbol: 'đ');
    formatRevenue = formatter.format(totalRevenue);
    return formatRevenue;
  }



  // String formatterRevenue(int totalRevenue) {
  //   if (totalRevenue >= 1000000000000.0) {
  //     final formatter = intl.NumberFormat.compact(locale: 'vi_VN');
  //     if (totalRevenue >= 1000000000000000.0) {
  //       formatRevenue = '${formatter.format(totalRevenue)}ỷ';
  //     } else {
  //       formatRevenue = '${formatter.format(totalRevenue)}riệu';
  //     }
  //   } else {
  //     final formatter = intl.NumberFormat.currency(
  //         locale: 'vi_VN', decimalDigits: 0, symbol: 'đ');
  //     formatRevenue = formatter.format(totalRevenue);
  //   }
  //   return formatRevenue;
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
