import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/takephoto.controller.dart';

class TakephotoScreen extends GetView<TakephotoController> {
  const TakephotoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TakephotoScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TakephotoScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
