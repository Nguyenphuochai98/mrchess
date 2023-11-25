import 'dart:convert';
import 'dart:typed_data';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;

import 'item_model.dart';

class UserProvider extends GetConnect {
  // Get request
  Future<ProductResponse?> getImage(Uint8List dataImage) async {
    try {
      final apiUrlFindItem = Uri.parse("http://192.168.2.11:8000/api/search");

      var request = http.MultipartRequest('POST', apiUrlFindItem);
      request.files.add(http.MultipartFile.fromBytes('image', dataImage,
          filename: 'image.jpg'));
      http.Response response =
          await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return ProductResponse.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      print('Error sending request: $e');
    }
  }
}
