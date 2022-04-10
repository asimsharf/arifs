import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/documents_controller.dart';
import '../../get_media_file/controllers/get_media_file_controller.dart';
import '../controllers/media_play_list_controller.dart';

class MediaPlayListView extends GetView<MediaPlayListController> {
  MediaPlayListView({Key? key}) : super(key: key);
  DocumentsController cDocuments = Get.put(DocumentsController());
  GetMediaFileController cGetMediaFile = Get.put(GetMediaFileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text('قائمة تشغيل الوسائط'),
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
                  return ListView.builder(
                    itemCount: controller.lists.length,
                    itemBuilder: (_, i) {
                      var obj = controller.lists[i];
                      return Card(
                        elevation: 3,
                        color: Colors.white60,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: ListTile(
                          title: Text("${obj.title}"),
                          subtitle: Text("${obj.description}"),
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              obj.type == '.mp4'
                                  ? Icons.ondemand_video
                                  : obj.type == '.pdf'
                                      ? Icons.document_scanner
                                      : obj.type == '.mp3'
                                          ? Icons.play_arrow
                                          : obj.type == '.m4a'
                                              ? Icons.ondemand_video
                                              : Icons.image,
                              color: obj.type == '.mp4'
                                  ? Colors.black
                                  : obj.type == '.pdf'
                                      ? Colors.red
                                      : obj.type == '.mp3'
                                          ? Colors.orange
                                          : obj.type == '.m4a'
                                              ? Colors.black
                                              : Colors.green,
                            ),
                          ),
                          trailing: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: IconButton(
                              icon: Icon(
                                obj.type == '.mp4'
                                    ? Icons.play_circle_fill
                                    : obj.type == '.pdf'
                                        ? Icons.file_present
                                        : obj.type == '.mp3'
                                            ? Icons.play_arrow
                                            : obj.type == '.m4a'
                                                ? Icons.play_circle_fill
                                                : Icons.image_search,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                //controller.lists[i].school
                                cGetMediaFile.mediaFile(
                                  mediaFileId: obj.id,
                                  schoolId: 16,
                                  type: obj.type,
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
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
