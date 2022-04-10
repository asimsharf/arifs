import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/test_questions_controller.dart';

class TestQuestionsView extends GetView<TestQuestionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestQuestionsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TestQuestionsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
