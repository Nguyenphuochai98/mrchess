import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'item_model.dart';

class UserProvider extends GetConnect {
  // Get request
  Future<ProductResponse?> getImage(Uint8List dataImage) async {
    try {
      final apiUrlFindItem =
          Uri.parse("http://192.168.227.96:8000/api/search");

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

  Future<void> saveScans(Uint8List image) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> scans = prefs.getStringList('scans') ?? [];
      if (scans.length > 4) {
        scans.removeAt(0);
      }
      scans.add(String.fromCharCodes(image));
      prefs.setStringList('scans', scans);
    } catch (e) {
      print('Error sending request: $e');
    }
  }

  Future<List<Uint8List>> getScans() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> scans = prefs.getStringList('scans') ?? [];

      List<Uint8List> data =
          scans.map((e) => Uint8List.fromList(e.codeUnits)).toList();

      return data;
    } catch (e) {
      print('Error sending request: $e');
      return [];
    }
  }
}
