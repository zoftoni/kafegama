import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';

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
              elevation: 0.0,
              flexibleSpace: const AppBarBG(),
              centerTitle: true,
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              title: const Text("DONASI"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Obx(
                  () {
                    var donasiCampaign = controller.donasiCampaign.value;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Text(
                              donasiCampaign.title!,
                              style: const TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(),
                          child: TextFormField(
                            controller: controller.amountC,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Nominal",
                              hintText: "Nominal Donasi",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Hero(
                          tag: "payment_btn",
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              maximumSize: const Size(double.infinity, 56),
                              minimumSize: const Size(double.infinity, 56),
                            ),
                            onPressed: () {
                              controller.pay();
                            },
                            child: Text(
                              "Payment".toUpperCase(),
                            ),
                          ),
                        ),
                        Container(
                            child: (controller.isLoading.value)
                                ? const Padding(
                                    padding: EdgeInsets.all(20),
                                    child: CircularProgressIndicator())
                                : Row())
                      ],
                    );
                  },
                ),
              ),
            ));
      },
    );
  }
}
