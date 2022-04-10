import 'package:arif/app/views/views/documents_view.dart';
import 'package:get/get.dart';

import '../modules/get_media_file/bindings/get_media_file_binding.dart';
import '../modules/get_media_file/views/get_media_file_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/lessons/bindings/lessons_binding.dart';
import '../modules/lessons/views/lessons_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/media_play_list/bindings/media_play_list_binding.dart';
import '../modules/media_play_list/views/media_play_list_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/test_questions/bindings/test_questions_binding.dart';
import '../modules/test_questions/views/test_questions_view.dart';
import '../modules/test_view/bindings/test_view_binding.dart';
import '../modules/test_view/views/test_view_view.dart';
import '../modules/tests/bindings/tests_binding.dart';
import '../modules/tests/views/tests_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const LOGIN = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LESSONS,
      page: () => LessonsView(),
      binding: LessonsBinding(),
    ),
    GetPage(
      name: _Paths.MEDIA_PLAY_LIST,
      page: () => MediaPlayListView(),
      binding: MediaPlayListBinding(),
    ),
    GetPage(
      name: _Paths.GET_MEDIA_FILE,
      page: () => GetMediaFileView(),
      binding: GetMediaFileBinding(),
    ),
    GetPage(
      name: _Paths.TESTS,
      page: () => TestsView(),
      binding: TestsBinding(),
    ),
    GetPage(
      name: _Paths.TEST_QUESTIONS,
      page: () => TestQuestionsView(),
      binding: TestQuestionsBinding(),
    ),
    GetPage(
      name: _Paths.TEST_VIEW,
      page: () => TestViewView(),
      binding: TestViewBinding(),
    ),
    GetPage(
      name: _Paths.DOCUMENTS_VIEW,
      page: () => DocumentsView(),
    ),
  ];
}
