import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginController extends GetxController {
  LoginView? view;
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  APIProvider apiProvider = Get.find();

  @override
  void onInit() async {
    super.onInit();
    var isUserExist = await SessionManager().containsKey("USER");
    if (isUserExist) {
      // Get.offAll(const MainView());
    }
  }

  Future<void> login() async {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      isLoading.value = true;

      try {
        final result = await apiProvider.login(emailC.text, passC.text);
        if (result.error != null) {
          Get.snackbar(
            "Error",
            result.error ?? "",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
          );
          return;
        }

        await SessionManager().set("USER", result.user).then((value) =>
            SessionManager()
                .set("TOKEN", result.accessToken)
                .then((value) => Get.off(() => const MainView())));
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

  openResetPassword() async {
    if (!await launchUrl(Uri.parse(APIProvider.RESET_PASS_URL),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch url';
    }
  }

  openRegister() async {
    Get.to(() => const RegisterView());
  }
}
