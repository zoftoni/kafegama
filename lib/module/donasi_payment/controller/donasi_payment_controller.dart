import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';

class DonasiPaymentController extends GetxController {
  DonasiPaymentView? view;
  var donasiCampaign = DonasiCampaign().obs;
  RxBool isLoading = false.obs;
  var user = User().obs;

  TextEditingController amountC = TextEditingController(text: '');
  TextEditingController emailC = TextEditingController(text: '');
  TextEditingController noHpC = TextEditingController(text: '');

  @override
  void onInit() {
    super.onInit();
    donasiCampaign.value = Get.arguments[0]['donasiCampaign'];
    SessionManager().containsKey("USER").then((value) {
      if (value) {
        SessionManager().get("USER").then((value) {
          if (value != null) {
            user.value = User.fromJson(value);
            emailC.text = user.value.email!;
            noHpC.text = user.value.noHp!;
          } else {
            user.value = User();
          }
        });
      } else {
        Get.off(() => const LoginView());
        return;
      }
    });
  }

  Future<void> pay() async {
    if (amountC.text.isNotEmpty) {
      isLoading.value = true;

      APIProvider apiProvider = Get.find();

      try {
        final result = await apiProvider.payDonasi(emailC.text, noHpC.text,
            int.parse(amountC.text), donasiCampaign.value.idDonasiCampaign);
        if (result.error != null) {
          Get.snackbar(
            "Error",
            result.error ?? "",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
          );
          return;
        }

        //success
        Get.to(() => const PaymentResultView(), arguments: [
          {"type": "DONASI", "status": "SUCCESS"}
        ]);
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
