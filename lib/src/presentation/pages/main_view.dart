import 'package:badges/badges.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:car_rental/src/presentation/pages/home/home_view.dart';
import 'package:car_rental/src/presentation/pages/main_controller.dart';
import 'package:car_rental/src/presentation/pages/notification/notification_view.dart';
import 'package:car_rental/src/presentation/pages/search/search_view.dart';
import 'package:car_rental/src/presentation/pages/users/user_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import '../../shared/colors.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children:  const [HomeView(), SearchView(), NotificationView(), UserView()],
      ),
      bottomNavigationBar: ValueBuilder<int?>(
        initialValue: 0,
        builder: (value, updateFn) => Container(
          color: Colors.grey[200],
          child: BubbleBottomBar(
            opacity: .2,
            currentIndex: value,
            onTap: (tab) {
              controller.pageController.animateToPage(tab!,
                  duration: controller.animationDuration, curve: Curves.ease);
              updateFn(tab);
            },
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            elevation: 8,
            hasInk: true,
            items: <BubbleBottomBarItem>[
              BubbleBottomBarItem(
                backgroundColor: kPrimaryColor,
                icon: const Icon(
                  LineIcons.home,
                  color: Colors.black54,
                ),
                activeIcon: const Icon(LineIcons.home),
                title: const Text("Home"),
              ),
              BubbleBottomBarItem(
                backgroundColor: kPrimaryColor,
                icon: const Icon(
                  LineIcons.search,
                  color: Colors.black54,
                ),
                activeIcon: const Icon(LineIcons.search),
                title: const Text("Search"),
              ),
              BubbleBottomBarItem(
                  backgroundColor: kPrimaryColor,
                  icon: Badge(
                    padding: const EdgeInsets.only(
                        top: 5.0, bottom: 5.0, right: 4.0, left: 5.0),
                    animationType: BadgeAnimationType.scale,
                    animationDuration: const Duration(milliseconds: 200),
                    badgeContent: const Text(
                      "7",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    child: const Icon(
                      LineIcons.bell,
                      color: Colors.black54,
                    ),
                  ),
                  activeIcon: const Icon(LineIcons.bell),
                  title: const Text("Notification")),
              BubbleBottomBarItem(
                backgroundColor: kPrimaryColor,
                icon: const Icon(
                  LineIcons.user,
                  color: Colors.black54,
                ),
                activeIcon: const Icon(LineIcons.user),
                title: const Text("Profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
