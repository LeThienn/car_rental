import 'package:badges/badges.dart';
import 'package:car_rental/src/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class WidgetScreenHeader extends StatelessWidget {
  const WidgetScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 90,
            child: Stack(
              children: [
                CircularStepProgressIndicator(
                  padding: 0,
                  currentStep: 77,
                  totalSteps: 100,
                  selectedStepSize: 4,
                  width: 80,
                  height: 80,
                  startingAngle: 2.3,
                  selectedColor: Colors.yellow[600],
                  unselectedColor: Colors.white,
                  roundedCap: (_, __) => true,
                  child: const Center(
                    child: CircleAvatar(
                      maxRadius: 30,
                      backgroundImage:
                          NetworkImage("https://1.bigdata-vn.com/wp-content/uploads/2021/10/Anh-avatar-dep-va-doc-dao-lam-hinh-dai-dien.jpg")
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Badge(
                    shape: BadgeShape.square,
                    animationType: BadgeAnimationType.scale,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 2.2),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    badgeColor: Colors.yellow,
                    borderRadius: BorderRadius.circular(13),
                    elevation: 0,
                    badgeContent: const Text(
                      "Gold",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 2, right: 3),
                      child: Text(
                        "DoLa",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ),
                    Text(
                      "2000",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ],
                ),
              ),
              Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 23,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
