import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PdfDocuments extends StatefulWidget {
  String title;
  Uri url;
  PdfDocuments({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);
  @override
  _PdfDocumentsState createState() => _PdfDocumentsState();
}

class _PdfDocumentsState extends State<PdfDocuments> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(
      widget.url.toString(),
      cacheManager: CacheManager(
        Config(
          "customCacheKey",
          stalePeriod: const Duration(days: 2),
          maxNrOfCacheObjects: 10,
        ),
      ),
    );

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(widget.title),
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
            child: _isLoading
                ? const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: SpinKitRipple(
                      size: 50,
                      color: Color(0xFFBF202E),
                    ),
                  )
                : PDFViewer(
                    document: document,
                    zoomSteps: 1,
                    indicatorPosition: IndicatorPosition.bottomRight,
                    numberPickerConfirmWidget: const Text("موافق"),
                  ),
          ),
        ],
      ),
    );
  }
}
