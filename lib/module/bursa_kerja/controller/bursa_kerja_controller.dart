import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafegama/model/bursa_kerja/bursa_kerja.dart';
import 'package:kafegama/model/bursa_kerja/bursa_kerja_list.dart';
import 'package:kafegama/service/api_provider.dart';
import '../view/bursa_kerja_view.dart';

class BursaKerjaController extends GetxController {
  BursaKerjaView? view;
  RxBool isLoading = false.obs;
  final _bursaKerjaList = <BursaKerja>[].obs;
  List<BursaKerja> get bursaKerjaList => _bursaKerjaList.toList();
  int page = 0;
  String keyword = "";

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> handleRefresh() async {
    page = 0;
    bursaKerjaList.clear();
    _bursaKerjaList.clear();
    getData();
  }

  Future<void> getData() async {
    isLoading.value = true;
    APIProvider apiProvider = Get.find();
    try {
      final result = await apiProvider.getBursaKerja(++page, keyword);
      BursaKerjaList resultList = result;
      if (page > resultList.meta!.lastPage!.toInt()) {
        return;
      }

      if (resultList.meta!.lastPage!.toInt() == 1) {
        bursaKerjaList.clear();
      }

      page = resultList.meta!.currentPage!;
      _bursaKerjaList.addAll(resultList.data!);
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
