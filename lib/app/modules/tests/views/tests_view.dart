import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tests_controller.dart';

class TestsView extends GetView<TestsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TestsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
