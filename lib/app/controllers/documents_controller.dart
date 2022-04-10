import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class DocumentsController extends GetxController {
  var isProcessing = true.obs;
  late PDFDocument document;

  loadDocument({required Uri url}) async {
    document = await PDFDocument.fromURL(
      "$url",
      cacheManager: CacheManager(
        Config(
          "customCacheKey",
          stalePeriod: const Duration(days: 2),
          maxNrOfCacheObjects: 10,
        ),
      ),
    );

    Get.toNamed(Routes.DOCUMENTS_VIEW);
    isProcessing(false);
    update();
  }
}
