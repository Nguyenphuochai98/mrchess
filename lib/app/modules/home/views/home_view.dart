import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          children: [
            Expanded(child: TextField(controller: controller.textEditingController)),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  controller.getImage();
                },
                child: const Text('Increment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
