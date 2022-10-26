import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';

class IuranPaymentController extends GetxController {
  IuranPaymentView? view;
  var jenisAnggota = JenisAnggota();
  RxBool isLoading = false.obs;
  var user = User().obs;

  TextEditingController emailC = TextEditingController(text: '');
  TextEditingController noHpC = TextEditingController(text: '');

  @override
  void onInit() {
    super.onInit();
    jenisAnggota = Get.arguments[0]['jenis_anggota'];
    SessionManager().containsKey("USER").then((value) {
      if (value) {
        SessionManager().get("USER").then((value) {
          if (value != null) {
            user.value = User.fromJson(value);
            emailC.text = user.value.email!;
            noHpC.text = user.value.noHp!;
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
    isLoading.value = true;

    APIProvider apiProvider = Get.find();

    try {
      final result = await apiProvider.payIuran(
          emailC.text, noHpC.text, jenisAnggota.idJenisAnggota);
      if (result.error != null) {
        Get.snackbar(
          "Error",
          result.error ?? "",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
        return;
      }

      //success
      Get.to(() => const PaymentResultView(), arguments: [
        {"type": "IURAN", "status": "SUCCESS"}
      ]);
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
