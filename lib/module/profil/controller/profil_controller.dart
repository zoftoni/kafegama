import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilController extends GetxController {
  ProfilView? view;
  final alumni = Alumni().obs;
  var userProfile = UserProfile();
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
      final result = await apiProvider.getUserProfileData();
      userProfile = result;

      if (userProfile.error != null) {
        Get.snackbar(
          "Error",
          "error:: " + userProfile.error!,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
      } else {
        alumni.value = userProfile.data!;
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

  launchImageUrl() async {
    if (!await launchUrl(Uri.parse(alumni.value.photo!),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch picture';
    }
  }

  openLink(url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch url';
    }
  }
}
