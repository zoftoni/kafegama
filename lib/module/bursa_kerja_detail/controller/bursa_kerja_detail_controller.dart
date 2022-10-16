import 'package:get/get.dart';
import 'package:kafegama/core.dart';
import 'package:url_launcher/url_launcher.dart';

class BursaKerjaDetailController extends GetxController {
  BursaKerjaDetailView? view;
  var bursaKerja = BursaKerja().obs;

  @override
  void onInit() {
    super.onInit();
    bursaKerja.value = Get.arguments[0]['bursaKerja'];
  }

  launchImageUrl() async {
    if (!await launchUrl(Uri.parse(bursaKerja.value.picture!),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch picture';
    }
  }

  openLink(url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch url';
    }
  }
}
