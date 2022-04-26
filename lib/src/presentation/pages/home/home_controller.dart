import 'package:car_rental/src/resource/services/car_service.dart';
import 'package:get/get.dart';

import '../../../resource/models/car.dart';

class HomeController extends GetxController{

  List<Car> cars = [];
  late Car displayCar;
  

  @override
  void onInit() {
    super.onInit();
    cars = CarService().getCarList();
    displayCar = cars[2];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}