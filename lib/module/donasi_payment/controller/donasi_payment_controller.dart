import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DonasiPaymentController extends GetxController {
  DonasiPaymentView? view;
  var donasiCampaign = DonasiCampaign().obs;
  RxBool isLoading = false.obs;
  var user = User().obs;

  TextEditingController amountC = TextEditingController(text: '');

  @override
  void onInit() {
    super.onInit();
    donasiCampaign.value = Get.arguments[0]['donasiCampaign'];
    SessionManager().containsKey("USER").then((value) {
      if (value) {
        SessionManager().get("USER").then((value) {
          if (value != null) {
            user.value = User.fromJson(value);
          } else {
            user.value = User();
          }
        });
      } else {
        Get.off(() => const LoginView());
        return;
      }
    });
  }

  Future<void> pay() async {
    if (amountC.text.isNotEmpty) {
      isLoading.value = true;

      APIProvider apiProvider = Get.find();

      try {
        final result = await apiProvider.payDonasi(
            int.parse(amountC.text), donasiCampaign.value.idDonasiCampaign);
        if (result.error != null) {
          Get.snackbar(
            "Error",
            result.error ?? "",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
          );
          return;
        }

        if (!await launchUrl(Uri.parse(result.url!),
            mode: LaunchMode.externalApplication)) {
          throw 'Could not launch url';
        }

        try {
          PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
          await pusher.init(
            apiKey: result.appKey!,
            cluster: result.cluster!,
            onEvent: onEvent,
          );
          await pusher.subscribe(channelName: user.value.id.toString());
          await pusher.connect();
        } catch (e) {
          log("ERROR: $e");
        }
      } catch (e) {
        Get.snackbar(
          "Error",
          "error:: $e",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  void onEvent(PusherEvent event) {
    log("onEvent: $event");

    if (!event.data.isEmpty) {
      //success
      Get.to(() => const PaymentResultView(), arguments: [
        {"type": "DONASI", "status": "SUCCESS"}
      ]);
    }
  }
}
