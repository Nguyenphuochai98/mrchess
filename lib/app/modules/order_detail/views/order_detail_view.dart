import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mrchess/app/utils/app_colors.dart';
import 'package:mrchess/app/widgets/item_components.dart';
import 'package:mrchess/app/widgets/ui_text.dart';

import '../../../utils/calculator.dart';
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.arrow_back_ios,
                                    color: Colors.white),
                                onPressed: () {
                                  Get.back();
                                }),
                            const Spacer(),
                            IconButton(
                                icon:
                                    const Icon(Icons.home, color: Colors.white),
                                onPressed: () {
                                  Get.toNamed('/home');
                                }),
                          ],
                        ),
                      ),
                    ),
                    const Row(
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
                    const SizedBox(
                      height: 6,
                    ),
                    const UIText(
                      'Your order has been successfully paid and is currently in the process of being refunded.',
                      color: Colors.white,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                  ],
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: UIColors.shopee,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 36, vertical: 5),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  const UIText(
                    'Order Shopee ID',
                    color: Colors.white,
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  UIText(
                    'Total amount: ${formatCurrency(controller.product.price ?? 0)}',
                    color: Colors.white,
                    size: 12,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  UIText(
                    'Cash Back: ${controller.perTotal} VND(${controller.per}%)',
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
              UIText("Suggestion For you", color: UIColors.primary),
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
                child: Obx(
                  () => controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : controller.recommandation.value != null ? GridView.builder(
                    itemCount: controller.recommandation.value!.data
                              .length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15,
                                  childAspectRatio: 5 / 8),
                          itemBuilder: (BuildContext context, int index) =>
                              ItemComponent(
                                  product: controller
                                      .recommandation.value!.data[index])) : UIText("Not Have Data"),
                )),
            flex: 4,
          )
        ],
      ),
    );
  }
}
