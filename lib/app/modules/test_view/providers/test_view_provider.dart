import 'package:get/get.dart';

import '../test_view_model.dart';

class TestViewProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return TestView.fromJson(map);
      if (map is List)
        return map.map((item) => TestView.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<TestView?> getTestView(int id) async {
    final response = await get('testview/$id');
    return response.body;
  }

  Future<Response<TestView>> postTestView(TestView testview) async =>
      await post('testview', testview);
  Future<Response> deleteTestView(int id) async => await delete('testview/$id');
}
