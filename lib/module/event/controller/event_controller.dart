import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafegama/model/event/event.dart';
import 'package:kafegama/model/event/event_list.dart';
import 'package:kafegama/service/api_provider.dart';
import '../view/event_view.dart';

class EventController extends GetxController {
  EventView? view;
  RxBool isLoading = false.obs;
  final _eventList = <Event>[].obs;
  List<Event> get eventList => _eventList.toList();
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
      final result = await apiProvider.getEvent(++page, keyword);
      EventList resultList = result;
      if (page > resultList.meta!.lastPage!.toInt()) {
        return;
      }

      if (resultList.meta!.lastPage!.toInt() == 1) {
        eventList.clear();
      }

      page = resultList.meta!.currentPage!;
      _eventList.addAll(resultList.data!);
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
