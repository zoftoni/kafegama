import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';

class RegisterController extends GetxController {
  RegisterView? view;
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;
  TextEditingController nameC = TextEditingController();
  TextEditingController noHPC = TextEditingController();
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
        noHPC.text.isNotEmpty &&
        emailC.text.isNotEmpty &&
        passC.text.isNotEmpty &&
        passConfirmationC.text.isNotEmpty) {
      isLoading.value = true;
      APIProvider apiProvider = Get.find();

      try {
        final result = await apiProvider.register(nameC.text, noHPC.text,
            emailC.text, passC.text, passConfirmationC.text);
        if (result.error != null) {
          Get.snackbar(
            "Error",
            result.error ?? "",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
            onTap: (snack) => {Get.off(() => const LoginView())},
          );
          return;
        }

        Get.defaultDialog(
            title: "Success",
            middleText: result.message ?? "",
            backgroundColor: Colors.white,
            textConfirm: "OK",
            radius: 6,
            onConfirm: () {
              Get.off(() => const LoginView());
            });
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
