import 'package:get/get.dart';

import '../controllers/takephoto_controller.dart';

class TakephotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TakephotoController>(
      () => TakephotoController(),
    );
  }
}
