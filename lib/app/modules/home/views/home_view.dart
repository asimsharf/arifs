import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../get_media_file/controllers/get_media_file_controller.dart';
import '../../lessons/controllers/lessons_controller.dart';
import '../../login/controllers/login_controller.dart';
import '../../media_play_list/controllers/media_play_list_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final LoginController cAuth = Get.put(LoginController());
  final LessonsController cLessons = Get.put(LessonsController());
  final MediaPlayListController cMediaPlayList =
      Get.put(MediaPlayListController());
  final GetMediaFileController cMediaFile = Get.put(GetMediaFileController());

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F8FA),
        appBar: AppBar(
          title: const Text('منصة عارف للتعليم'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('مرحباً : ${controller.getObject.name}'),
                accountEmail: Text('${controller.getObject.email}'),
              ),
              Card(
                elevation: 0.1,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  title: const Text(
                    "الرئيسية",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  leading: const Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ),
              ),
              Card(
                elevation: 0.1,
                child: ListTile(
                  onTap: () => controller.logOut(),
                  title: const Text(
                    "خروج",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  leading: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SizedBox(
          height: size.height,
          child: Stack(
            children: <Widget>[
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
                padding: const EdgeInsets.only(top: 50, left: 2, right: 2),
                child: Card(
                  elevation: 0.1,
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Obx(
                        () {
                          if (controller.isProcessing.value) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: SpinKitRipple(
                                size: 50,
                                color: Color(0xFF03A4ED),
                              ),
                            );
                          }
                          return Row(
                            children: controller.listsLevels
                                .map(
                                  (e) => InkWell(
                                    onTap: () =>
                                        controller.subjects(levelId: e.id),
                                    child: Container(
                                      width: 150,
                                      margin: const EdgeInsets.only(right: 10),
                                      height: size.height * 0.15 - 100,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF03A4ED),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5,
                                          )
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${e.name}",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120, left: 0, right: 0),
                child: Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.listsSubjects.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return Align(
                          heightFactor: 0.7,
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 150,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(100),
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () => cLessons.lessons(
                                subjectId: controller.listsSubjects[i].id,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "${controller.listsSubjects[i].name}",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "إجمالي عدد الدروس ( ${controller.listsSubjects[i].lessons} )",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${controller.listsSubjects[i].level!.name}",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                    Image.network(
                                      "https://dev.arifelearning.com${controller.listsSubjects[i].image}",
                                      fit: BoxFit.fill,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
