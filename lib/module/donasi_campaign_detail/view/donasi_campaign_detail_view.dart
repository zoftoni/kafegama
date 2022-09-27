import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../controller/donasi_campaign_detail_controller.dart';

import 'package:get/get.dart';

class DonasiCampaignDetailView extends StatelessWidget {
  const DonasiCampaignDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DonasiCampaignDetailController>(
      init: DonasiCampaignDetailController(),
      builder: (controller) {
        controller.view = this;
        var donasiCampaign = controller.donasiCampaign.value;

        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  //body
                  SingleChildScrollView(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Image.network(donasiCampaign.picture!),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.launchImageUrl();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                              ),
                              child: const Text("Buka Gambar"),
                            ),
                            Text(donasiCampaign.title!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(
                              height: 10.0,
                            ),
                            SelectableHtml(
                              data: donasiCampaign.text!,
                              onLinkTap: (url, _, __, ___) async {
                                controller.openLink(url);
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                              ),
                              onPressed: () {},
                              child: const Text("Donasi"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
