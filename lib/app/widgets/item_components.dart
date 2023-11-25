import 'package:flutter/material.dart';
import 'package:mrchess/app/widgets/ui_rich_text.dart';
import 'package:mrchess/app/widgets/ui_text.dart';

import '../constant/constants.dart';
import '../modules/home/provider/item_model.dart';
import '../utils/app_colors.dart';
import '../utils/asset_images.dart';
import '../utils/assets_icons.dart';

class ItemComponent extends StatefulWidget {
  const ItemComponent({ Key? key}) : super(key: key);
  // final Product product;

  @override
  State<ItemComponent> createState() => _ItemComponentState();
}

class _ItemComponentState extends State<ItemComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(5),
              topLeft: Radius.circular(5),
            ),
            child: Image.asset(
              AssetImages.living,
            ),
          ),const SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: RichText(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
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
                        fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UIRichText(text: '4.000.000', color: UIColors.primary),
                Row(
                  children: [
                    Icon(
                      Icons.refresh,
                      color: UIColors.primary,
                      size: 16,
                      weight: 20,
                    ),
                    UIText(
                      '5%',
                      color: UIColors.primary,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
