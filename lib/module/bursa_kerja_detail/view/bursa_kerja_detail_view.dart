import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kafegama/shared/util/theme/appbar_bg.dart';
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
          appBar: AppBar(
            elevation: 0.0,
            flexibleSpace: const AppBarBG(),
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title: const Text("BURSA KERJA"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.network(
                      bursaKerja.picture!,
                      fit: BoxFit.cover,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.launchImageUrl();
                      },
                      style: ElevatedButton.styleFrom(),
                      child: const Text("Buka Gambar"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      //body
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
