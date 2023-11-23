import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mrchess/app/constant/constants.dart';
import 'package:mrchess/app/constant/dimens_manager.dart';
import 'package:mrchess/app/utils/app_colors.dart';
import 'package:mrchess/app/utils/asset_images.dart';
import 'package:mrchess/app/widgets/ui_button.dart';
import 'package:mrchess/app/widgets/ui_text.dart';

import '../../../widgets/ui_icon_button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DimensManager();
    return Scaffold(
      backgroundColor: UIColors.backgroundBlueNights,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(
                              DimensManager.dimens.setRadius(50),
                            ),
                            bottomLeft: Radius.circular(
                              DimensManager.dimens.setRadius(50),
                            ),
                          ),
                          child: Image.asset(
                            AssetImages.backgroundLens,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: DimensManager.dimens.setHeight(10)),
                        child: Column(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  UIIconButton(child: Container()),
                                  UIText(
                                    UIStrings.len,
                                    size: DimensManager.dimens.setSp(24),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      UIIconButton(
                                        child: const Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                                flex: 6,
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: EdgeInsets.all(
                                        DimensManager.dimens.setWidth(25)),
                                    child: Icon(
                                      Icons.photo_camera_outlined,
                                      size: DimensManager.dimens.setSp(24),
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Flexible(
              flex: 7,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: DimensManager.dimens.setWidth(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UIText(
                        UIStrings.messengerAccess,
                      color: Colors.white,
                      textAlign: TextAlign.center,
                      size: DimensManager.dimens.setSp(20),
                    ),
                    SizedBox(height: DimensManager.dimens.setHeight(50),),
                    const UIButton(title: UIStrings.allowAccess, radius: 10,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
