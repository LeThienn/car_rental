import 'package:get/get.dart';

import '../presentation/pages/main_binding.dart';
import '../presentation/pages/main_view.dart';
import 'app_routes.dart';

class AppPages{
  static const INITIAL = Routes.HOME;

   static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => MainView(),
      binding: MainBinding(),
    ),
   ];
}