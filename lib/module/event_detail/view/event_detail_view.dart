import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
                              child: Image.network(event.picture!),
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
