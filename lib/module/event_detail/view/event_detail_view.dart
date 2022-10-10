import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kafegama/shared/util/theme/appbar_bg.dart';
import '../controller/event_detail_controller.dart';

import 'package:get/get.dart';

class EventDetailView extends StatelessWidget {
  const EventDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventDetailController>(
      init: EventDetailController(),
      builder: (controller) {
        controller.view = this;
        var event = controller.event.value;

        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            flexibleSpace: const AppBarBG(),
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title: const Text("EVENT"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.network(
                      event.picture!,
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
                              Text(event.title!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Tanggal : " + (event.tglEvent ?? ""),
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              SelectableHtml(
                                data: event.text!,
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
