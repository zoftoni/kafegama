import 'package:get/get.dart';
import 'package:kafegama/model/event/event.dart';
import 'package:url_launcher/url_launcher.dart';
import '../view/event_detail_view.dart';

class EventDetailController extends GetxController {
  EventDetailView? view;

  var event = Event().obs;

  @override
  void onInit() {
    super.onInit();
    event.value = Get.arguments[0]['event'];
  }

  launchImageUrl() async {
    if (!await launchUrl(Uri.parse(event.value.picture!),
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
