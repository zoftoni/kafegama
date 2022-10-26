import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

class IuranPaymentView extends StatelessWidget {
  const IuranPaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IuranPaymentController>(
      init: IuranPaymentController(),
      builder: (controller) {
        controller.view = this;
        var jenisAnggota = controller.jenisAnggota;
        final numFormat = NumberFormat("#,##0", "id_ID");

        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            flexibleSpace: const AppBarBG(),
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title: const Text("IURAN MEMBERSHIP"),
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          jenisAnggota.title!,
                          style: const TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              "Nominal : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              numFormat.format(int.parse(jenisAnggota.price)),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        controller: controller.emailC,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Email",
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        controller: controller.noHpC,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "No HP",
                          hintText: "No HP",
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
                )),
          ),
        );
      },
    );
  }
}
