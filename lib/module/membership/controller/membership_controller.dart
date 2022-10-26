import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';

class MembershipController extends GetxController {
  MembershipView? view;
  RxBool isLoading = false.obs;
  final _membershipList = <JenisAnggota>[].obs;
  List<JenisAnggota> get membershipList => _membershipList.toList();
  var user = User().obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> handleRefresh() async {
    membershipList.clear();
    _membershipList.clear();
    getData();
  }

  Future<void> getData() async {
    isLoading.value = true;
    SessionManager().containsKey("USER").then((value) {
      if (value) {
        SessionManager().get("USER").then((value) {
          if (value != null) {
            user.value = User.fromJson(value);
          } else {
            user.value = User();
          }
        });
      } else {
        Get.off(() => const LoginView());
        return;
      }
    });

    APIProvider apiProvider = Get.find();
    try {
      final result = await apiProvider.getJenisAnggota();
      JenisAnggotaList resultList = result;
      _membershipList.addAll(resultList.data!);
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
