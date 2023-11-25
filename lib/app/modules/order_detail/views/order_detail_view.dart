import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mrchess/app/constant/dimens_manager.dart';
import 'package:mrchess/app/utils/app_colors.dart';
import 'package:mrchess/app/utils/asset_images.dart';
import 'package:mrchess/app/utils/assets_icons.dart';
import 'package:mrchess/app/widgets/ui_rich_text.dart';
import 'package:mrchess/app/widgets/ui_text.dart';

import '../../../constant/constants.dart';
import '../controllers/order_detail_controller.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  const OrderDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DimensManager();
    final dimen = DimensManager.dimens;
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(dimen.setRadius(30)),
                bottomLeft: Radius.circular(dimen.setRadius(30))),
            child: Image.asset(
              AssetImages.living,
              width: double.infinity,
              height: dimen.setHeight(400),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: dimen.setHeight(10),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: dimen.setWidth(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Image.asset(
                                  AssetIcons.iconShopee,
                                  width: 20,
                                ),
                              ),
                            ),
                            TextSpan(
                              //tên sản phầm
                              text:
                                  'Ấm Siêu Tốc Inox 1,8 Lít Đun Sôi Cực Nhanh - Bình siêu tốc inox tốt cho sức khỏe người sử dụng - ST2 New Hot',
                              style: TextStyle(
                                color: UIColors.textLight,
                                letterSpacing: 0.75,
                                fontFamily: Fonts.nunito,
                                height: 1.25,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          AssetIcons.iconCashBack,
                          width: dimen.setWidth(64),
                        ),
                        Positioned(
                          top: 10,
                          child: UIText(
                            //% cash back
                            '5%',
                            color: UIColors.primary,
                            fontWeight: FontWeight.bold,
                            size: dimen.setSp(16),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: dimen.setHeight(10),
                ),

                //Giá tiền gốc
                UIRichText(
                  text: '4.000.000',
                  color: UIColors.primary,
                  size: dimen.setSp(24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    UIText('Cash back'),
                    SizedBox(
                      width: dimen.setWidth(10),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(dimen.setRadius(30)),
                          border:
                              Border.all(color: UIColors.primary, width: 1)),
                      padding: EdgeInsets.symmetric(
                          vertical: dimen.setHeight(10),
                          horizontal: dimen.setWidth(20)),
                      child: UIRichText(
                        text: '32.000',
                        color: UIColors.primary,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: dimen.setHeight(20),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(dimen.setRadius(30)),
                      border:
                      Border.all(color: UIColors.primary, width: 1)),
                  padding: EdgeInsets.symmetric(
                      vertical: dimen.setHeight(10),
                      horizontal: dimen.setWidth(20)),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIText('Cash Back Process', color: UIColors.primary, size: dimen.setSp(20), fontWeight: FontWeight.bold,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
