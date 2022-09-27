import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafegama/model/donasi_campaign/donasi_campaign.dart';
import 'package:kafegama/model/donasi_campaign/donasi_campaign_list.dart';
import 'package:kafegama/service/api_provider.dart';
import '../view/donasi_campaign_view.dart';

class DonasiCampaignController extends GetxController {
  DonasiCampaignView? view;
  RxBool isLoading = false.obs;
  final _donasiCampaignList = <DonasiCampaign>[].obs;
  List<DonasiCampaign> get donasiCampaignList => _donasiCampaignList.toList();
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
      final result = await apiProvider.getDonasiCampaign(++page, keyword);
      DonasiCampaignList resultList = result;
      if (page > resultList.meta!.lastPage!.toInt()) {
        return;
      }

      if (resultList.meta!.lastPage!.toInt() == 1) {
        donasiCampaignList.clear();
      }

      page = resultList.meta!.currentPage!;
      _donasiCampaignList.addAll(resultList.data!);
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
