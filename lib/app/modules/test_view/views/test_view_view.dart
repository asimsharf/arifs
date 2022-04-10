import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/test_view_controller.dart';

class TestViewView extends GetView<TestViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestViewView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TestViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
