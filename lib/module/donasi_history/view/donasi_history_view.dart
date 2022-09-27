import 'package:flutter/material.dart';
import '../controller/donasi_history_controller.dart';

import 'package:get/get.dart';

class DonasiHistoryView extends StatelessWidget {
  const DonasiHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DonasiHistoryController>(
      init: DonasiHistoryController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("DonasiHistory"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: const [
                  //body
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
