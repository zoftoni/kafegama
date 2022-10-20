import 'package:flutter/material.dart';
import '../controller/donasi_payment_controller.dart';

import 'package:get/get.dart';

class DonasiPaymentView extends StatelessWidget {
  const DonasiPaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DonasiPaymentController>(
      init: DonasiPaymentController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("DonasiPayment"),
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