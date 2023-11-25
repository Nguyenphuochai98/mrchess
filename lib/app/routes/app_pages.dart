import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/search_result_view.dart';
import '../modules/search_result/bindings/search_result_binding.dart';
import '../modules/search_result/views/search_result_view.dart';
import '../modules/take_photo/bindings/take_photo_binding.dart';
import '../modules/take_photo/views/take_photo_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TAKE_PHOTO,
      page: () => const TakePhotoView(),
      binding: TakePhotoBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_RESULT,
      page: () => const SearchResultView(),
      binding: SearchResultBinding(),
    ),
  ];
}
