import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafegama/model/iuran_trx/iuran_trx.dart';
import 'package:kafegama/model/iuran_trx/iuran_trx_list.dart';

import 'package:kafegama/service/api_provider.dart';
import '../view/iuran_history_view.dart';

class IuranHistoryController extends GetxController {
  IuranHistoryView? view;
  RxBool isLoading = false.obs;
  final _iuranTrxList = <IuranTrx>[].obs;
  List<IuranTrx> get iuranTrxList => _iuranTrxList.toList();
  int page = 0;
  String keyword = "";

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> handleRefresh() async {
    page = 0;
    iuranTrxList.clear();
    _iuranTrxList.clear();
    getData();
  }

  Future<void> getData() async {
    isLoading.value = true;
    APIProvider apiProvider = Get.find();
    try {
      final result = await apiProvider.getIuranTrx(++page, keyword);
      IuranTrxList resultList = result;
      if (page > resultList.meta!.lastPage!.toInt()) {
        return;
      }

      if (resultList.meta!.lastPage!.toInt() == 1) {
        iuranTrxList.clear();
      }

      page = resultList.meta!.currentPage!;
      _iuranTrxList.addAll(resultList.data!);
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
