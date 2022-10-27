import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';
import 'package:url_launcher/url_launcher.dart';

class VerifNimController extends GetxController {
  VerifNimView? view;
  RxBool isLoading = false.obs;

  TextEditingController nimC = TextEditingController(text: '');
  TextEditingController angkatanTahunC = TextEditingController(text: '');

  Future<void> save() async {
    if (nimC.text.isEmpty) {
      Get.snackbar(
        "Error",
        "NIM wajib diisi",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
      );
      return;
    }

    if (angkatanTahunC.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Angkatan wajib diisi",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
      );
      return;
    }

    APIProvider apiProvider = Get.find();
    isLoading.value = true;
    try {
      final result =
          await apiProvider.verifikasiNIM(nimC.text, angkatanTahunC.text);

      if (result.error != null) {
        Get.defaultDialog(
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableHtml(
              data: result.error.toString(),
              onLinkTap: (url, _, __, ___) async {
                openLink(url);
              },
            ),
          ),
          title: "Error",
          middleText: result.error.toString(),
          textConfirm: "OK",
          radius: 6,
          onConfirm: () {
            Get.close(1);
          },
        );

        return;
      }

      final result2 = await apiProvider.refreshUser();
      if (result2.error != null) {
        Get.snackbar(
          "Error",
          result2.error ?? "",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
        return;
      }

      await SessionManager().set("USER", result2.user).then((value) => {
            Get.defaultDialog(
                title: "Success",
                middleText: result.message ?? "",
                backgroundColor: Colors.white,
                textConfirm: "OK",
                radius: 6,
                onConfirm: () {
                  Get.offAll(() => const MainView());
                })
          });
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

  openLink(url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch url';
    }
  }
}
