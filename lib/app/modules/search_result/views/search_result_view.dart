import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mrchess/app/utils/calculator.dart';

import '../../../constant/dimens_manager.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/asset_images.dart';
import '../../../widgets/ui_rich_text.dart';
import '../../../widgets/ui_text.dart';
import '../../home/provider/item_model.dart';
import '../controllers/search_result_controller.dart';

class SearchResultView extends GetView<SearchResultController> {
  const SearchResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DimensManager();
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        body: Obx(() => controller.dataResponse.value != null
            ? SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: DimensManager.dimens.setWidth(16)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: DimensManager.dimens.setHeight(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 24,
                              color: UIColors.primary,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          UIText('Product List',
                              color: UIColors.primary,
                              fontWeight: FontWeight.bold,
                              size: 20),
                          const SizedBox(width: 24)
                        ],
                      ),
                      SizedBox(
                        height: DimensManager.dimens.setHeight(20),
                      ),
                      Expanded(
                          child: Obx(
                        () => GridView.builder(
                            itemCount:
                                controller.dataResponse.value!.data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 7 / 11),
                            itemBuilder: (_, index) {
                              Product product =
                                  controller.dataResponse.value!.data[index];
                              int cashBackPer = generateRandomCashBack();
                              double cashBack =
                                  ((cashBackPer * product.price!) ~/ 100) * 1.0;

                              return GestureDetector(
                                onTap: () {
                                  controller.onItemClicked(product,cashBackPer,cashBack);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        child: Image.network(
                                          product.image!,
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                          height: 180,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            UIText(
                                              product.name!,
                                              color: UIColors.textLight,
                                              size: DimensManager.dimens
                                                  .setSp(14),
                                              maxLines: 2,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: DimensManager.dimens
                                                  .setHeight(5),
                                            ),
                                            UIText(
                                              formatCurrency(product.price!),
                                              color: UIColors.primary,
                                              fontWeight: FontWeight.bold,
                                              size: 14,
                                            ),
                                            UIText(
                                              'Cash back (${cashBackPer}%):',
                                              color: UIColors.shopee,
                                              size: 14,
                                            ),
                                            UIText(
                                              formatCurrency(cashBack),
                                              size: 14,
                                              color: UIColors.primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )),
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              )));
  }
}
