import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mrchess/app/constant/dimens_manager.dart';
import 'package:mrchess/app/utils/app_colors.dart';
import 'package:mrchess/app/utils/asset_images.dart';
import 'package:mrchess/app/widgets/ui_rich_text.dart';

import '../../../widgets/item_components.dart';
import '../../../widgets/ui_text.dart';
import '../controllers/home_controller.dart';
import 'package:we_slide/we_slide.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _panelMinSize = 80.0;
    final double _panelMaxSize = MediaQuery
        .of(context)
        .size
        .height - 50;
    DimensManager();
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      body: Obx(
            () =>
        controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : WeSlide(
          panelMinSize: _panelMinSize,
          panelMaxSize: _panelMaxSize,
          isUpSlide: true,
          body: Container(
            color: Colors.white.withOpacity(0.8),
            child: Column(
              children: [
                Flexible(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.getImage();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(
                              DimensManager.dimens.setWidth(30)),
                          child: Icon(
                            Icons.photo_camera_outlined,
                            size: DimensManager.dimens.setSp(36),
                            color: UIColors.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: DimensManager.dimens.setWidth(20),
                      vertical: DimensManager.dimens.setHeight(10),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          DimensManager.dimens.setRadius(20)),
                      border: Border.all(
                        color: UIColors.primary,
                        width: 1,
                      ),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: DimensManager.dimens.setWidth(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                             UIText(
                              'Last Scan',
                              color: UIColors.primary,
                               fontWeight: FontWeight.bold,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.close,
                                  color: UIColors.primary,
                                  size: DimensManager.dimens.setSp(24),
                                ))
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.scans.value.length,
                              itemBuilder: (BuildContext context,
                                  int index) =>
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: ClipRRect(
                                      child: Image.memory(
                                        controller.scans.value[index],
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          DimensManager.dimens.setRadius(5)),
                                    ),
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.white.withOpacity(0.8),
                  ),
                )
              ],
            ),
          ),
          panel: Container(
            color: Colors.white.withOpacity(0.8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: UIColors.primary,
                  child: Column(
                    children: [
                      SizedBox(
                        height: DimensManager.dimens.setHeight(10),
                      ),
                      Center(
                        child: Container(
                          width: 30,
                          height: 3,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: DimensManager.dimens.setHeight(20),
                      ),
                      UIText(
                        'Order history',
                        size: DimensManager.dimens.setSp(20),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: DimensManager.dimens.setHeight(20),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    color: Colors.white.withOpacity(0.8),
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 5 / 8),
                        itemBuilder: (BuildContext context, int index) =>
                        const ItemComponent()),
                  ),
                  flex: 4,
                )
              ],
            ),
          ),
          panelHeader: Container(
              height: _panelMinSize,
              color: UIColors.primary,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: DimensManager.dimens.setWidth(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: DimensManager.dimens.setHeight(10),
                    ),
                    Center(
                      child: Container(
                        width: 30,
                        height: 3,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: DimensManager.dimens.setHeight(20),
                    ),
                    UIText(
                      'Order history',
                      size: DimensManager.dimens.setSp(20),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
