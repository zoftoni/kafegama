import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';

class HomeController extends GetxController {
  HomeView? view;

  RxBool isLoading = false.obs;
  var beritaList = BeritaList().obs;
  var eventList = EventList().obs;
  var donasiCampaignList = DonasiCampaignList().obs;
  var user = User().obs;

  @override
  void onInit() {
    super.onInit();
    getData();
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

    getBeritaLatest().then((value) =>
        getEventLatest().then((value) => getDonasiLatest().then((value) {
              // popup verif nim
              if (user.value.nim == null) {
                SessionManager().get("LAST_POPUP").then((value) {
                  final date2 = DateTime.now();
                  var lastPopupDate = DateTime.now();
                  var diffInHours = 9999;

                  if (value != null) {
                    lastPopupDate = DateTime.parse(value);
                    diffInHours = lastPopupDate.difference(date2).inHours;
                  }
                  if (diffInHours > 24) {
                    SessionManager().set("LAST_POPUP", date2).then((value) {
                      //showpopup
                      Get.defaultDialog(
                          title: "Verifikasi NIM",
                          middleText:
                              "Apakah Anda alumni FEB UGM ?\nSilahkan lengkapi NIM & Tahun Angkatan Anda ",
                          backgroundColor: Colors.white,
                          textConfirm: "YES",
                          textCancel: "NO",
                          radius: 6,
                          onConfirm: () {
                            Get.delete<HomeController>();
                            Get.to(() => const VerifNimView());
                          },
                          onCancel: () {
                            Get.back();
                          });
                    });
                  }
                });
              }
            })));
  }

  Future<void> handleRefresh() async {
    //refresh user
    APIProvider apiProvider = Get.find();
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

    await SessionManager().set("USER", result2.user).then((value) {
      user.value = result2.user!;
    });
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
      } else {
        if (user.value.nim != null) {
          await SessionManager().get("LAST_POPUP").then((value) {
            final date2 = DateTime.now();
            var lastPopupDate = DateTime.now();
            var diffInHours = 9999;

            if (value != null) {
              lastPopupDate = DateTime.parse(value);
              diffInHours = lastPopupDate.difference(date2).inHours;
            }
            if (diffInHours > 24) {
              //showpopup
              DonasiCampaign donasiRand = (result.data!..shuffle()).first;
              SessionManager()
                  .set("LAST_POPUP", date2.toString())
                  .then((value) {
                Get.dialog(Dialog(
                  child: SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  donasiRand.picture!,
                                ),
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topCenter),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            donasiRand.title!,
                            overflow: TextOverflow.fade,
                            maxLines: 5,
                            softWrap: true,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Get.to(() => const DonasiCampaignDetailView(),
                                    arguments: [
                                      {"donasiCampaign": donasiRand}
                                    ]);
                              },
                              child: const Text("Donasi"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
              });
            }
          });
        }
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
