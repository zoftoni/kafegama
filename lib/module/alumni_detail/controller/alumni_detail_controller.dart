import 'package:get/get.dart';
import 'package:kafegama/model/alumni/alumni.dart';
import 'package:url_launcher/url_launcher.dart';
import '../view/alumni_detail_view.dart';

class AlumniDetailController extends GetxController {
  AlumniDetailView? view;
  var alumni = Alumni().obs;

  @override
  void onInit() {
    super.onInit();
    alumni.value = Get.arguments[0]['alumni'];
  }

  launchImageUrl() async {
    if (!await launchUrl(Uri.parse(alumni.value.photo!),
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
