import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';
import 'package:kafegama/model/berita/berita_list.dart';
import 'package:kafegama/model/donasi_campaign/donasi_campaign_list.dart';
import 'package:kafegama/model/event/event_list.dart';
import 'package:kafegama/model/user.dart';
import 'package:kafegama/service/api_provider.dart';

class HomeController extends GetxController {
  HomeView? view;

  RxBool isLoading = false.obs;
  var beritaList = BeritaList().obs;
  var eventList = EventList().obs;
  var donasiCampaignList = DonasiCampaignList().obs;
  var user = User().obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    SessionManager().containsKey("USER").then((value) {
      if (value) {
        SessionManager().get("USER").then((value) => {
              if (value != null)
                {user.value = User.fromJson(value)}
              else
                {user.value = User()}
            });
      } else {
        Get.off(() => const LoginView());
        return;
      }
    });

    getBeritaLatest()
        .then((value) => getEventLatest().then((value) => getDonasiLatest()));
  }

  Future<void> handleRefresh() async {
    getData();
  }

  Future<void> getBeritaLatest() async {
    isLoading.value = true;
    APIProvider apiProvider = Get.find();
    try {
      final result = await apiProvider.getBeritaLatest();
      beritaList.value = result;
      if (beritaList.value.error != null) {
        Get.snackbar(
          "Error",
          "error:: " + beritaList.value.error!,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
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

  Future<void> getEventLatest() async {
    isLoading.value = true;
    APIProvider apiProvider = Get.find();
    try {
      final result = await apiProvider.getEventLatest();
      eventList.value = result;

      if (eventList.value.error != null) {
        Get.snackbar(
          "Error",
          "error:: " + eventList.value.error!,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
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

  Future<void> getDonasiLatest() async {
    isLoading.value = true;
    APIProvider apiProvider = Get.find();
    try {
      final result = await apiProvider.getDonasiLatest();
      donasiCampaignList.value = result;

      if (donasiCampaignList.value.error != null) {
        Get.snackbar(
          "Error",
          "error:: " + donasiCampaignList.value.error!,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
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

  openLogin() async {
    var data = await Get.to(() => const LoginView());
    if (data == 'success') getData();
  }
}
