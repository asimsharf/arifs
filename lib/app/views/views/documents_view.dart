import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../controllers/documents_controller.dart';

class DocumentsView extends GetView<DocumentsController> {
  const DocumentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("controller.title"),
      ),
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: 20,
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
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
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
                return PDFViewer(
                  document: controller.document,
                  zoomSteps: 1,
                  indicatorPosition: IndicatorPosition.bottomRight,
                  numberPickerConfirmWidget: const Text(
                    "موافق",
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
