import 'package:get/get.dart';
import 'package:kafegama/model/donasi_campaign/donasi_campaign.dart';
import 'package:url_launcher/url_launcher.dart';
import '../view/donasi_campaign_detail_view.dart';

class DonasiCampaignDetailController extends GetxController {
  DonasiCampaignDetailView? view;
  var donasiCampaign = DonasiCampaign().obs;

  @override
  void onInit() {
    super.onInit();
    donasiCampaign.value = Get.arguments[0]['donasiCampaign'];
  }

  launchImageUrl() async {
    if (!await launchUrl(Uri.parse(donasiCampaign.value.picture!),
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
