import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafegama/model/donasi_trx/donasi_trx.dart';
import 'package:kafegama/model/donasi_trx/donasi_trx_list.dart';

import 'package:kafegama/service/api_provider.dart';
import '../view/donasi_history_view.dart';

class DonasiHistoryController extends GetxController {
  DonasiHistoryView? view;
  RxBool isLoading = false.obs;
  final _donasiTrxList = <DonasiTrx>[].obs;
  List<DonasiTrx> get donasiTrxList => _donasiTrxList.toList();
  int page = 0;
  String keyword = "";

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> handleRefresh() async {
    page = 0;
    donasiTrxList.clear();
    _donasiTrxList.clear();
    getData();
  }

  Future<void> search(value) async {
    keyword = value;
    page = 0;
    donasiTrxList.clear();
    _donasiTrxList.clear();
    getData();
  }

  Future<void> getData() async {
    isLoading.value = true;
    APIProvider apiProvider = Get.find();
    try {
      final result = await apiProvider.getDonasiTrx(++page, keyword);
      DonasiTrxList resultList = result;
      if (page > resultList.meta!.lastPage!.toInt()) {
        return;
      }

      if (resultList.meta!.lastPage!.toInt() == 1) {
        donasiTrxList.clear();
      }

      page = resultList.meta!.currentPage!;
      _donasiTrxList.addAll(resultList.data!);
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
