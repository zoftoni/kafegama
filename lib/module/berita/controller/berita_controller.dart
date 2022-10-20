import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafegama/model/berita/berita.dart';
import 'package:kafegama/model/berita/berita_list.dart';
import 'package:kafegama/service/api_provider.dart';
import '../view/berita_view.dart';

class BeritaController extends GetxController {
  BeritaView? view;
  RxBool isLoading = false.obs;
  final _beritaList = <Berita>[].obs;
  List<Berita> get beritaList => _beritaList.toList();
  int page = 0;
  String keyword = "";

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> handleRefresh() async {
    page = 0;
    beritaList.clear();
    _beritaList.clear();
    getData();
  }

  Future<void> search(value) async {
    keyword = value;
    page = 0;
    beritaList.clear();
    _beritaList.clear();
    getData();
  }

  Future<void> getData() async {
    isLoading.value = true;
    APIProvider apiProvider = Get.find();
    try {
      final result = await apiProvider.getBerita(++page, keyword);
      BeritaList resultList = result;
      if (page > resultList.meta!.lastPage!.toInt()) {
        return;
      }

      if (resultList.meta!.lastPage!.toInt() == 1) {
        beritaList.clear();
      }

      page = resultList.meta!.currentPage!;
      _beritaList.addAll(resultList.data!);
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
