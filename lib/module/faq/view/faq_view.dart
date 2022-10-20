import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kafegama/core.dart';

import 'package:get/get.dart';

class FaqView extends StatelessWidget {
  const FaqView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FaqController>(
      init: FaqController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            flexibleSpace: const AppBarBG(),
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title: const Text("FAQ"),
          ),
          body: SingleChildScrollView(
              controller: ScrollController(),
              child: Obx(() {
                var faq = controller.faq.value;
                return controller.isLoading.value
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Center(child: Text("..loading...")),
                      )
                    : Expanded(
                        child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SelectableHtml(
                          data: faq.content!,
                        ),
                      ));
              })),
        );
      },
    );
  }
}
