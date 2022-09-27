import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';
import 'package:kafegama/model/alumni/alumni.dart';
import 'package:kafegama/model/alumni/alumni_list.dart';
import 'package:kafegama/service/api_provider.dart';

class AlumniListController extends GetxController {
  AlumniListView? view;
  RxBool isLoading = false.obs;
  final _alumniList = <Alumni>[].obs;
  List<Alumni> get alumniList => _alumniList.toList();
  int page = 0;
  String keyword = "";

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> handleRefresh() async {
    getData();
  }

  Future<void> getData() async {
    isLoading.value = true;
    APIProvider apiProvider = Get.find();
    try {
      final result = await apiProvider.getAlumni(++page, keyword);
      AlumniList resultList = result;
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
    }
  }
}
