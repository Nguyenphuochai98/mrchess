import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constant/dimens_manager.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/asset_images.dart';
import '../../../widgets/ui_rich_text.dart';
import '../../../widgets/ui_text.dart';
import '../controllers/search_result_controller.dart';

class SearchResultView extends GetView<SearchResultController> {
  const SearchResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DimensManager();
    return Scaffold(
      backgroundColor: UIColors.backgroundBlueNights,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: DimensManager.dimens.setWidth(16)),
          child: Column(
            children: [
              SizedBox(
                height: DimensManager.dimens.setHeight(20),
              ),
              const UIText('Product List', color: Colors.white, fontWeight: FontWeight.bold,),
              SizedBox(
                height: DimensManager.dimens.setHeight(20),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 7/8),
                  itemBuilder: (_, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          AssetImages.living,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: 100,
                        ),
                        borderRadius: BorderRadius.circular(
                            DimensManager.dimens.setRadius(5)),
                      ),
                      UIText(
                        'It is a long established fact that a reader will be distracted by the readable content',
                        color: UIColors.textDartLight,
                        size: DimensManager.dimens.setSp(14),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: DimensManager.dimens.setHeight(5),
                      ),
                      UIRichText(
                        text: '4.000.000',
                        color: UIColors.textDartLight,
                        size: 12,
                      ),
                      Row(
                        children: [
                          const UIText('Cash back', color: Colors.white, size: 14,),
                          SizedBox(
                            width: DimensManager.dimens.setWidth(10),
                          ),
                          const UIRichText(
                            text: '32.000',
                            size: 14,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
