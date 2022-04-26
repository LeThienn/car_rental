import 'package:car_rental/src/presentation/pages/home/home_controller.dart';
import 'package:car_rental/src/presentation/pages/main_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(HomeController());
  }
  
}