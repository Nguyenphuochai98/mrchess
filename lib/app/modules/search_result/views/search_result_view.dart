import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
                              Get.toNamed(Routes.HOME);
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
                              return GestureDetector(
                                onTap: () {
                                  controller.onItemClicked(product);
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
                                          product.mainImage,
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
                                              CrossAxisAlignment.end,
                                          children: [
                                            UIText(
                                              product.name,
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
                                              controller.formatterRevenue(
                                                  product.price),
                                              fontWeight: FontWeight.bold,
                                              color: UIColors.primary,
                                              size: 16,
                                            ),
                                            // UIRichText(
                                            //   // text: product.price.toString(),
                                            //   text: controller.formatterRevenue(product.price),
                                            //   color: UIColors.primary,
                                            //   size: 16,
                                            // ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                UIText(
                                                  'Cash back',
                                                  color: UIColors.textLight,
                                                  size: 14,
                                                ),
                                                SizedBox(
                                                  width: DimensManager.dimens
                                                      .setWidth(10),
                                                ),
                                                UIRichText(
                                                  text: '32.000',
                                                  size: 14,
                                                  color: UIColors.primary,
                                                ),
                                              ],
                                            )
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
