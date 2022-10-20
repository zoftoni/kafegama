import 'package:flutter/material.dart';
import '../controller/payment_result_controller.dart';

import 'package:get/get.dart';

class PaymentResultView extends StatelessWidget {
  const PaymentResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentResultController>(
      init: PaymentResultController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("PaymentResult"),
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