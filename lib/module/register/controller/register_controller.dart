import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';
import 'package:kafegama/service/api_provider.dart';

class RegisterController extends GetxController {
  RegisterView? view;
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController passConfirmationC = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    var isUserExist = await SessionManager().containsKey("USER");
    if (isUserExist) {
      // Get.offAll(const MainView());
    }
  }

  Future<void> register() async {
    if (nameC.text.isNotEmpty &&
        emailC.text.isNotEmpty &&
        passC.text.isNotEmpty &&
        passConfirmationC.text.isNotEmpty) {
      isLoading.value = true;
      APIProvider apiProvider = Get.find();

      try {
        final result = await apiProvider.register(
            nameC.text, emailC.text, passC.text, passConfirmationC.text);
        if (result.error != null) {
          Get.snackbar(
            "Error",
            result.error ?? "",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
            onTap: (snack) => {Get.off(const MainView())},
          );
          return;
        }

        Get.snackbar(
          "Success",
          result.message ?? "",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
        return;
      } catch (e) {
        Get.snackbar(
          "Error",
          "error:: $e",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }
}
