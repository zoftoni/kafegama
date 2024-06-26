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
  final user = User().obs;

  @override
  void onInit() {
    super.onInit();
    SessionManager().containsKey("USER").then((value) {
      if (value) {
        SessionManager().get("USER").then((value) => {
              if (value != null)
                {user.value = User.fromJson(value)}
              else
                {user.value = User()}
            });
      }
    });
  }

  UserProfileController(
    this.mainController,
  );

  Future<void> logout() async {
    isLoading.value = true;
    // APIProvider apiProvider = Get.find();

    try {
      APIProvider apiProvider = Get.find();
      apiProvider.logout();
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

      SessionManager()
          .remove("USER")
          .then((value) => SessionManager().remove("TOKEN").then((value) {
                isLoading.value = false;
                // mainController.goToHome();
                Get.off(() => const LoginView());
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

  Future<void> deleteAccount() async {
    isLoading.value = true;
    // APIProvider apiProvider = Get.find();

    try {
      APIProvider apiProvider = Get.find();
      // apiProvider.deleteAccount();
      final result = await apiProvider.deleteAccount();
      if (result.error != null) {
        Get.snackbar(
          "Error",
          result.error ?? "",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
        return;
      } else {
        Get.defaultDialog(
            title: "Success",
            middleText: "Akun Anda Telah Dihapus",
            backgroundColor: Colors.white,
            textConfirm: "OK",
            radius: 6,
            onConfirm: () {
              SessionManager().remove("USER").then(
                  (value) => SessionManager().remove("TOKEN").then((value) {
                        isLoading.value = false;
                        // mainController.goToHome();
                        Get.off(() => const LoginView());
                      }));
            });
      }
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
