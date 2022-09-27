import 'package:get/get.dart';
import 'package:kafegama/model/berita/berita.dart';
import 'package:url_launcher/url_launcher.dart';
import '../view/berita_detail_view.dart';

class BeritaDetailController extends GetxController {
  BeritaDetailView? view;
  var berita = Berita().obs;

  @override
  void onInit() {
    super.onInit();
    berita.value = Get.arguments[0]['berita'];
  }

  launchImageUrl() async {
    if (!await launchUrl(Uri.parse(berita.value.picture!),
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
