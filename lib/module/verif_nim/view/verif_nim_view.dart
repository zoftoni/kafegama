import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';

import 'package:get/get.dart';

class VerifNimView extends StatelessWidget {
  const VerifNimView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifNimController>(
      init: VerifNimController(),
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
            title: const Text("VERIFIKASI NIM"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 24,
                            offset: Offset(0, 11),
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                  "Silahkan lengkapi NIM & Tahun Angkatan Anda"),
                            ),
                            Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(),
                              child: TextFormField(
                                controller: controller.nimC,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "NIM",
                                  hintText: "NIM",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onChanged: (value) {},
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: controller.angkatanTahunC,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Angkatan Tahun",
                                  hintText: "Angkatan Tahun",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onChanged: (value) {},
                              ),
                            ),
                          ])),
                  Hero(
                    tag: "login_btn",
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        maximumSize: const Size(double.infinity, 56),
                        minimumSize: const Size(double.infinity, 56),
                      ),
                      onPressed: () {
                        controller.save();
                      },
                      child: Text(
                        "Submit".toUpperCase(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
