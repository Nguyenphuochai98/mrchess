import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'item_model.dart';

class UserProvider extends GetConnect {
  final String _baseUrl = "https://dnyspbgnjhftrmjumdfb.supabase.co/rest/v1/";
  final String _baseUrlLocal = "http://192.168.227.180:8000";


  // Get request
  Future<ProductResponse?> getImage(Uint8List dataImage) async {
    try {
      final apiUrlFindItem =
          Uri.parse("${_baseUrlLocal}/api/search");

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

  Future<ProductResponse?> getRecommandation(String producName) async {
    try {
      final apiUrlFindItem =
      Uri.parse("$_baseUrlLocal/api/recommandation?query=${producName}}");

      var response = await http.get(apiUrlFindItem);


      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return ProductResponse.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      print('Error sending request: $e');
      return null;
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


  Future<List<Product>?> getProductResponseHistory()async{
    try {
      final apiUrlFindItem =
      Uri.parse('$_baseUrl/order_history?select=*');

      var response = await http.get(apiUrlFindItem,headers: {
        "apiKey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRueXNwYmduamhmdHJtanVtZGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA4NzM3ODAsImV4cCI6MjAxNjQ0OTc4MH0.rdrAtvQOQdYJyZNOWmrCpoTBTi_dhiNtunf9XRGszBE",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRueXNwYmduamhmdHJtanVtZGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA4NzM3ODAsImV4cCI6MjAxNjQ0OTc4MH0.rdrAtvQOQdYJyZNOWmrCpoTBTi_dhiNtunf9XRGszBE"
      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<Product> productList = (data as List)
            .map((productJson) => Product.fromJson(productJson))
            .toList();
        return productList;
      } else {
        return null;
      }

    } catch (e) {
      print('Error sending request: $e');
    }
  }

  Future<void> saveHistory(Product product)async{
    try {
      final apiUrlFindItem =
      Uri.parse('$_baseUrl/order_history');

      var response = await http.post(apiUrlFindItem,headers: {
        "apiKey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRueXNwYmduamhmdHJtanVtZGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA4NzM3ODAsImV4cCI6MjAxNjQ0OTc4MH0.rdrAtvQOQdYJyZNOWmrCpoTBTi_dhiNtunf9XRGszBE",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRueXNwYmduamhmdHJtanVtZGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA4NzM3ODAsImV4cCI6MjAxNjQ0OTc4MH0.rdrAtvQOQdYJyZNOWmrCpoTBTi_dhiNtunf9XRGszBE"
      },body: {
        "link" : product.link,
        "name" : product.name,
        "price" : product.price.toString(),
        "main_image" : product.mainImage,
      });


    } catch (e) {
      print('Error sending request: $e');
    }
  }
}
