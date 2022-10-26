import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';

class PaymentResultController extends GetxController {
  PaymentResultView? view;
  var status = "";
  var type = "";
  @override
  void onInit() {
    super.onInit();
    status = Get.arguments[0]['status'];
    type = Get.arguments[0]['type'];
  }

  void callback() async {
    if (type == "DONASI") {
      Get.close(2);
      Get.off(() => const DonasiHistoryView());
    } else if (type == "IURAN") {
      //refresh user
      APIProvider apiProvider = Get.find();
      final result2 = await apiProvider.refreshUser();
      if (result2.error != null) {
        Get.snackbar(
          "Error",
          result2.error ?? "",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
        return;
      }

      await SessionManager().set("USER", result2.user).then((value) {
        Get.close(2);
        Get.off(() => const IuranHistoryView());
      });
    }
  }
}
