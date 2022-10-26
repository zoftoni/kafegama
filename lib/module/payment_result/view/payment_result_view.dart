import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';

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
              elevation: 0.0,
              flexibleSpace: const AppBarBG(),
              centerTitle: true,
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              title: const Text("PAYMENT"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        height: 170,
                        padding: const EdgeInsets.all(35),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: controller.status == "SUCCESS"
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 100,
                              )
                            : const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 100,
                              ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      controller.status == "SUCCESS"
                          ? Text(
                              "Terima Kasih",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 36,
                              ),
                            )
                          : const Text(
                              "Maaf",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 36,
                              ),
                            ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      controller.status == "SUCCESS"
                          ? const Text(
                              "Payment Berhasil",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            )
                          : const Text(
                              "Payment Gagal",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      SizedBox(
                        width: 200,
                        child: Hero(
                          tag: "confirm_btn",
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              maximumSize: const Size(double.infinity, 56),
                              minimumSize: const Size(double.infinity, 56),
                            ),
                            onPressed: () {
                              controller.callback();
                            },
                            child: const Text(
                              "OK",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
