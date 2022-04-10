import 'package:get/get.dart';

import '../tests_model.dart';

class TestsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Tests.fromJson(map);
      if (map is List) return map.map((item) => Tests.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Tests?> getTests(int id) async {
    final response = await get('tests/$id');
    return response.body;
  }

  Future<Response<Tests>> postTests(Tests tests) async =>
      await post('tests', tests);
  Future<Response> deleteTests(int id) async => await delete('tests/$id');
}
