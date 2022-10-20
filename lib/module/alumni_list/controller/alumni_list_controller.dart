import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';

class AlumniListController extends GetxController {
  AlumniListView? view;
  RxBool isLoading = false.obs;
  final _alumniList = <Alumni>[].obs;
  List<Alumni> get alumniList => _alumniList.toList();
  int page = 0;
  String keyword = "";
  final user = User().obs;

  @override
  void onInit() {
    super.onInit();

    SessionManager().get("USER").then((value) {
      if (value != null) {
        user.value = User.fromJson(value);
        if (user.value.nim == null) {
          Get.defaultDialog(
              title: "Blocked",
              middleText: "Silahkan Verifikasi NIM untuk membuka menu ini",
              backgroundColor: Colors.white,
              textConfirm: "OK",
              radius: 6,
              onConfirm: () {
                Get.back();
              });
          return;
        } else {
          getData();
        }
      } else {
        Get.off(() => const LoginView());
      }
    });
  }

  Future<void> handleRefresh() async {
    page = 0;
    alumniList.clear();
    _alumniList.clear();
    getData();
  }

  Future<void> search(value) async {
    keyword = value;
    page = 0;
    alumniList.clear();
    _alumniList.clear();
    getData();
  }

  Future<void> getData() async {
    isLoading.value = true;
    APIProvider apiProvider = Get.find();
    try {
      final result = await apiProvider.getAlumni(++page, keyword);
      AlumniList resultList = result;
      // error
      if (resultList.error != null) {
        Get.snackbar(
          "Error",
          "error:: " + resultList.error!,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
        return;
      }
      /////
      if (page > resultList.meta!.lastPage!.toInt()) {
        return;
      }

      if (resultList.meta!.lastPage!.toInt() == 1) {
        alumniList.clear();
      }

      page = resultList.meta!.currentPage!;
      _alumniList.addAll(resultList.data!);
    } catch (e) {
      Get.snackbar(
        "Error",
        "error:: " + e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
      );
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
