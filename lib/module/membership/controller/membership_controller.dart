import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';

class MembershipController extends GetxController {
  MembershipView? view;
  RxBool isLoading = false.obs;
  final _membershipList = <JenisAnggota>[].obs;
  List<JenisAnggota> get membershipList => _membershipList.toList();

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
