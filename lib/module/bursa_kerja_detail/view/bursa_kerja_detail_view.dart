import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../controller/bursa_kerja_detail_controller.dart';

import 'package:get/get.dart';

class BursaKerjaDetailView extends StatelessWidget {
  const BursaKerjaDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BursaKerjaDetailController>(
      init: BursaKerjaDetailController(),
      builder: (controller) {
        controller.view = this;
        var bursaKerja = controller.bursaKerja.value;

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
                              child: Image.network(bursaKerja.picture!),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.launchImageUrl();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey,
                              ),
                              child: const Text("Buka Gambar"),
                            ),
                            Text(bursaKerja.title!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(
                              height: 10.0,
                            ),
                            SelectableHtml(
                              data: bursaKerja.text!,
                              onLinkTap: (url, _, __, ___) async {
                                controller.openLink(url);
                              },
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
