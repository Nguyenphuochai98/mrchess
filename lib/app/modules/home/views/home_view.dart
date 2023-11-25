import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mrchess/app/constant/dimens_manager.dart';
import 'package:mrchess/app/utils/app_colors.dart';
import 'package:mrchess/app/utils/asset_images.dart';

import '../../../constant/constants.dart';
import '../../../widgets/ui_text.dart';
import '../controllers/home_controller.dart';
import 'package:we_slide/we_slide.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _panelMinSize = 50.0;
    final double _panelMaxSize = MediaQuery.of(context).size.height;
    DimensManager();
    return Scaffold(
      backgroundColor: UIColors.backgroundBlueNights,
      body: SafeArea(
        child: WeSlide(
          panelMinSize: _panelMinSize,
          panelMaxSize: _panelMaxSize,
          body: Container(
            color: UIColors.backgroundBlueNights,
            child: Column(
              children: [
                Flexible(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const UIText(
                        'Tap on the Camera',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: DimensManager.dimens.setHeight(20),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        padding:
                            EdgeInsets.all(DimensManager.dimens.setWidth(30)),
                        child: Icon(
                          Icons.photo_camera_outlined,
                          size: DimensManager.dimens.setSp(36),
                          color: Colors.white,
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
                      color: UIColors.backgroundLight,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: DimensManager.dimens.setWidth(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const UIText(
                              'Last Scan',
                              color: Colors.white,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: DimensManager.dimens.setSp(24),
                                ))
                          ],
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Flexible(
                                flex: 4,
                                child: ClipRRect(
                                  child: Image.asset(
                                    AssetImages.living,
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      DimensManager.dimens.setRadius(5)),
                                ),
                              ),
                              const Spacer(),
                              Flexible(
                                  flex: 8,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      UIText(
                                        '19/11/2023',
                                        color: UIColors.textDartLight,
                                        size: DimensManager.dimens.setSp(14),
                                      ),
                                      SizedBox(
                                        height:
                                            DimensManager.dimens.setHeight(5),
                                      ),
                                      UIText(
                                        'It is a long established fact that a reader will be distracted by the readable content',
                                        color: Colors.white,
                                        size: DimensManager.dimens.setSp(18),
                                        fontWeight: FontWeight.bold,
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height:
                                            DimensManager.dimens.setHeight(5),
                                      ),
                                      UIText(
                                        'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                                        color: UIColors.textDartLight,
                                        size: DimensManager.dimens.setSp(14),
                                        maxLines: 3,
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: UIColors.backgroundBlueNights,
                  ),
                )
              ],
            ),
          ),
          panel: Container(
            color: UIColors.backgroundLight,
            padding: EdgeInsets.symmetric(
                horizontal: DimensManager.dimens.setWidth(10)),
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
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
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
                          color: Colors.white,
                          size: DimensManager.dimens.setSp(14),
                          fontWeight: FontWeight.bold,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: DimensManager.dimens.setHeight(5),
                        ),
                        UIText(
                          'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                          color: UIColors.textDartLight,
                          size: DimensManager.dimens.setSp(10),
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: DimensManager.dimens.setHeight(5),
                        ),
                        RichText(
                            text: TextSpan(
                          text: '4.000.000 ',
                          style: TextStyle(
                            fontFamily: Fonts.nunito,
                            fontWeight: FontWeight.bold,
                            fontSize: DimensManager.dimens.setSp(15),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'đ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: DimensManager.dimens.setSp(15)),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          panelHeader: Container(
              height: _panelMinSize,
              color: UIColors.backgroundLight,
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
                ],
              )),
        ),
      ),
    );
  }
}
