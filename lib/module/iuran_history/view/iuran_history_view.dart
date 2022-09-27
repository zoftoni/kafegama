import 'package:flutter/material.dart';
import '../controller/iuran_history_controller.dart';

import 'package:get/get.dart';

class IuranHistoryView extends StatelessWidget {
  const IuranHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IuranHistoryController>(
      init: IuranHistoryController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("IuranHistory"),
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
