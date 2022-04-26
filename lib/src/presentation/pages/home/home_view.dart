import 'package:car_rental/src/presentation/pages/home/home_controller.dart';
import 'package:car_rental/src/presentation/widgets/homewidget/widget_screen_header.dart';
import 'package:car_rental/src/presentation/widgets/indicator/build_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildHeader(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WidgetScreenHeader(), // add widget
          const SizedBox(height: 30),
          _buyCarImage(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        controller.displayCar.model,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 35),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        controller.displayCar.brand,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                    ),

                    
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  ValueBuilder<int?> _buyCarImage() {
    return ValueBuilder<int?>(
      builder: (currentImage, updateFn) => Column(
        children: [
          Container(
            height: 150,
            child: PageView(
              physics: const BouncingScrollPhysics(),
              onPageChanged: updateFn,
              children: controller.displayCar.images.map(
                (e) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Image.asset(
                      e,
                      fit: BoxFit.scaleDown,
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          controller.displayCar.images.length > 1
              ? Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 12, bottom: 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: controller.displayCar.images
                          .map(
                            (image) => BuildIndicator(
                                isActive: controller.displayCar.images
                                        .indexOf(image) ==
                                    currentImage),
                          )
                          .toList()),
                )
              : Container()
        ],
      ),
    );
  }
}
