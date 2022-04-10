import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:photo_view/photo_view.dart';

import '../../../controllers/documents_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../views/views/pdf_documents.dart';
import '../providers/get_media_file_provider.dart';

class GetMediaFileController extends GetxController {
  var isProcessing = true.obs;
  final gStorage = GetStorage();

  late String lists;
  DocumentsController cDocuments = Get.put(DocumentsController());
  void mediaFile(
      {required int? mediaFileId, required schoolId, required type}) {
    GetMediaFileProvider()
        .getMediaFile(mediaFileId: mediaFileId, schoolId: schoolId)
        .then((res) {
      isProcessing(false);
      if (res!.code == 1) {
        lists = res.data!;
        print(Uri.parse("https://dev.arifelearning.com$lists"));
        switch (type) {
          case '.mp4':
            Get.toNamed(Routes.GET_MEDIA_FILE);
            break;
          case '.pdf':
            Get.to(
              () => PdfDocuments(
                url: Uri.parse("https://www.orimi.com/pdf-test.pdf"),
                title: "no th",
              ),
            );
            // cDocuments.loadDocument(
            //   // url: Uri.parse("https://dev.arifelearning.com$lists"),
            //   url: Uri.parse("https://www.orimi.com/pdf-test.pdf"),
            // );
            break;
          case '.mp3':
            Get.toNamed(Routes.GET_MEDIA_FILE);
            break;
          case '.m4a':
            Get.toNamed(Routes.GET_MEDIA_FILE);
            break;
          default:
            PhotoView(
              imageProvider: const AssetImage(
                // "${Uri.parse("https://dev.arifelearning.com$lists")}",
                "https://media.nngroup.com/media/editor/2019/11/11/usabilitytesting101_final7-copy.png",
              ),
            );
            break;
        }
      } else {
        Get.snackbar(
          "Error",
          "Error fetch data from back-end",
        );
      }
    }, onError: (err) {
      isProcessing(false);
    });
    update();
  }
}
