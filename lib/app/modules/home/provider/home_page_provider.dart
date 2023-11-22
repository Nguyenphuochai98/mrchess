import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:get/get_connect/connect.dart';

class UserProvider extends GetConnect {
  // Get request
  Future<void> getImage(int id) async {
    try {
      final openAI = OpenAI.instance.build(
          token: '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',
          baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
          enableLog: true);

      const prompt = "phòng làm việc tông màu trắng";

      final request = GenerateImage(prompt, 1,
          size: ImageSize.size256, responseFormat: Format.url);
      final GenImgResponse? gen = await openAI.generateImage(request);
      print("img url :${gen!.data!.last?.url}");
    } catch (e) {
      print(e);
    }
  }
}
