import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../controller/berita_detail_controller.dart';

import 'package:get/get.dart';

class BeritaDetailView extends StatelessWidget {
  const BeritaDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BeritaDetailController>(
      init: BeritaDetailController(),
      builder: (controller) {
        controller.view = this;
        var berita = controller.berita.value;

        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(214, 41, 118, 1),
                      Color.fromRGBO(150, 47, 191, 1)
                    ]),
              ),
            ),
          ),
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
                              child: Image.network(berita.picture!),
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
                            Text(berita.title!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(
                              height: 10.0,
                            ),
                            SelectableHtml(
                              data: berita.text!,
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
