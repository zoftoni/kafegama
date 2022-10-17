import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';

class VerifNimController extends GetxController {
  VerifNimView? view;
  RxBool isLoading = false.obs;

  TextEditingController nimC = TextEditingController(text: '');
  TextEditingController angkatanTahunC = TextEditingController(text: '');
  TextEditingController lulusanTahunC = TextEditingController(text: '');

  Future<void> save() async {
    if (nimC.text.isEmpty) {
      Get.snackbar(
        "Error",
        "NIM wajib diisi",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
      );
      return;
    }
    APIProvider apiProvider = Get.find();
    isLoading.value = true;
    try {
      final result = await apiProvider.verifikasiNIM(
          nimC.text, angkatanTahunC.text, lulusanTahunC.text);

      if (result.error != null) {
        Get.defaultDialog(
          title: "Error",
          middleText: result.error.toString(),
          textConfirm: "OK",
          radius: 6,
          onConfirm: () {
            Get.close(2);
          },
        );

        return;
      }

      final result2 = await apiProvider.refreshUser();
      if (result2.error != null) {
        Get.snackbar(
          "Error",
          result.error ?? "",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
        return;
      }

      await SessionManager().set("USER", result2.user).then((value) => {
            Get.defaultDialog(
                title: "Success",
                middleText: result.message ?? "",
                backgroundColor: Colors.white,
                textConfirm: "OK",
                radius: 6,
                onConfirm: () {
                  Get.off(() => const MainView());
                })
          });
    } catch (e) {
      Get.snackbar(
        "Error",
        "error:: " + e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
