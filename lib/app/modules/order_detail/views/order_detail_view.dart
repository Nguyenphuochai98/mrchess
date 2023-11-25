import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mrchess/app/utils/app_colors.dart';
import 'package:mrchess/app/widgets/item_components.dart';
import 'package:mrchess/app/widgets/ui_text.dart';

import '../../home/provider/item_model.dart';
import '../controllers/order_detail_controller.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  const OrderDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                    color: UIColors.primary),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SafeArea(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back_ios, color: Colors.white),
                            Spacer(),
                            Icon(Icons.home, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        UIText(
                          'Successful',
                          color: Colors.white,
                          size: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    UIText(
                      'Your order has been successfully paid and is currently in the process of being refunded.',
                      color: Colors.white,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                  ],
                )),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: UIColors.shopee,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 36, vertical: 5),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  UIText(
                    'Order Shopee ID',
                    color: Colors.white,
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  UIText(
                    'Total amount: 1.000.000 VND',
                    color: Colors.white,
                    size: 12,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  UIText(
                    'Total amount: 1.000.000',
                    color: Colors.white,
                    size: 12,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  UIText(
                    'Cash Back: 70.000VND(7%)',
                    color: Colors.white,
                    size: 12,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: UIColors.textLight,
                      height: 36,
                    )),
              ),
              UIText("Sucgestion For you", color: UIColors.primary),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: Divider(
                      color: UIColors.textLight,
                      height: 36,
                    )),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
    );
  }
}
