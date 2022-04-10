import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/get_media_file_controller.dart';

class GetMediaFileView extends GetView<GetMediaFileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetMediaFileView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          controller.lists,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
