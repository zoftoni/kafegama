// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';

import 'package:kafegama/core.dart';

class UserProfileController extends GetxController {
  UserProfileView? view;
  RxBool isLoading = false.obs;

  // ignore: prefer_typing_uninitialized_variables
  var mainController;

  UserProfileController(
    this.mainController,
  );

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  Future<void> logout() async {
    isLoading.value = true;
    // APIProvider apiProvider = Get.find();

    try {
      // final result = await apiProvider.logout();
      // if (result.error != null) {
      //   Get.snackbar(
      //     "Error",
      //     result.error ?? "",
      //     snackPosition: SnackPosition.TOP,
      //     backgroundColor: Colors.white,
      //   );
      //   return;
      // }

      await SessionManager()
          .remove("USER")
          .then((value) => SessionManager().remove("TOKEN").then((value) {
                isLoading.value = false;
                mainController.goToHome();
              }));
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        "error:: $e",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
      );
    }
  }
}
