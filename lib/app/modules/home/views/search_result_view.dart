import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mrchess/app/constant/dimens_manager.dart';
import 'package:mrchess/app/widgets/ui_text.dart';

import '../controllers/home_controller.dart';

class SearchResultPage extends GetView<HomeController> {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DimensManager();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UIText('Product List'),
            SizedBox(
              height: DimensManager.dimens.setHeight(10),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (_, index) => Row(
                children: [

                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
