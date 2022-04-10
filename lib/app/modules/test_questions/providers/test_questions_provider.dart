import 'package:get/get.dart';

import '../test_questions_model.dart';

class TestQuestionsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return TestQuestions.fromJson(map);
      if (map is List)
        return map.map((item) => TestQuestions.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<TestQuestions?> getTestQuestions(int id) async {
    final response = await get('testquestions/$id');
    return response.body;
  }

  Future<Response<TestQuestions>> postTestQuestions(
          TestQuestions testquestions) async =>
      await post('testquestions', testquestions);
  Future<Response> deleteTestQuestions(int id) async =>
      await delete('testquestions/$id');
}
