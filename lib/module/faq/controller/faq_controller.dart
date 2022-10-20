import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';

class FaqController extends GetxController {
  FaqView? view;
  final faq = Faq().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    isLoading.value = true;
    APIProvider apiProvider = Get.find();
    try {
      final result = await apiProvider.getFaq();

      if (result.error != null) {
        Get.snackbar(
          "Error",
          "error:: " + result.error!,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
      } else {
        faq.value = result.data!;
      }
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
