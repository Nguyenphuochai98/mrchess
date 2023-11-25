import 'package:camera/camera.dart';
import 'package:get/get.dart';

class TakePhotoController extends GetxController {
  late List<CameraDescription> _cameras;
  late CameraController controller;

  RxBool isCameraReady = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    _cameras = await availableCameras();
    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      isCameraReady.value = true;
    });
  }

  Future<void> take() async {
    XFile file = await controller.takePicture();
    Get.back(result: file);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
