import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../media_play_list/controllers/media_play_list_controller.dart';
import '../controllers/lessons_controller.dart';

class LessonsView extends GetView<LessonsController> {
  LessonsView({Key? key}) : super(key: key);
  final MediaPlayListController cGetMediaPlay =
      Get.put(MediaPlayListController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة الدروس المتاحة'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 0, right: 0),
            child: Obx(
              () {
                if (controller.isProcessing.value) {
                  return const Center(
                    child: Text(
                      'لحظة',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                } else {
                  return Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: controller.lists.map(
                      (e) {
                        return InkWell(
                          onTap: () {
                            cGetMediaPlay.mediaPlayList(lessoneId: e.id);
                          },
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Card(
                            elevation: 3,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Container(
                              width: size.width / 2.1,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://dev.arifelearning.com/${e.image}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 2,
                                  )
                                ],
                              ),
                              child: Container(
                                width: size.width / 2.1,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "${e.title}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
