import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/takephoto_controller.dart';

class TakephotoView extends GetView<TakephotoController> {
  const TakephotoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!controller.isCameraReady.value) {
        return Container();
      } else {
        return Stack(
          children: [
            CameraPreview(controller.controller),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(

                child: GestureDetector(
                  onTap: (){
                    controller.take();
                  },
                  child: Container(
                      height: 30, width: 60, color: Colors.red, child: Text("take")),
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}
