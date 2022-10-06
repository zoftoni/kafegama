import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/main_view.dart';

class MainController extends GetxController
    with GetSingleTickerProviderStateMixin {
  MainView? view;
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 4);
  }

  // @override
  // void onClose() {
  //   tabController.dispose();
  //   super.onClose();
  // }

  void goToHome() {
    tabController.animateTo(0);
    // tabController.;
  }
}
