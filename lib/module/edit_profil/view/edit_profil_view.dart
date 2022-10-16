import 'dart:io';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';

import 'package:get/get.dart';

class EditProfilView extends StatelessWidget {
  const EditProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfilController>(
      init: EditProfilController(),
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
              title: const Text("EDIT PROFIL"),
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(children: [
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
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Foto"),
                              const SizedBox(
                                height: 5.0,
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: controller.photo.value.path != ''
                                        ? Image.file(
                                            File(controller.photo.value.path),
                                            fit: BoxFit.cover,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(width: 1)),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child:
                                                controller.alumni.value.photo !=
                                                        null
                                                    ? Image.network(controller
                                                        .alumni.value.photo!)
                                                    : const SizedBox(
                                                        height: 20.0,
                                                      ),
                                          ),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    controller.pickImage();
                                  },
                                  child: const Text("Upload Foto")),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20.0),
                              child: const Text(
                                "Jenis Kelamin",
                                textAlign: TextAlign.left,
                              ),
                            ),
                            RadioListTile(
                                title: const Text("Male"),
                                value: 'MALE',
                                groupValue: controller.jenisKelamin,
                                dense: true,
                                onChanged: (value) {
                                  controller.jenisKelamin = value.toString();
                                }),
                            RadioListTile(
                                title: const Text("Female"),
                                value: 'FEMALE',
                                dense: true,
                                groupValue: controller.jenisKelamin,
                                onChanged: (value) {
                                  controller.jenisKelamin = value.toString();
                                }),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(),
                          child: TextFormField(
                            controller: controller.tempatLahirC,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Tempat Lahir",
                              hintText: "Tempat Lahir",
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
                            child: DateTimeFormField(
                              initialDate: DateTime.now(),
                              initialValue: controller.tglLahir,
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                hintStyle: TextStyle(color: Colors.black45),
                                errorStyle: TextStyle(color: Colors.redAccent),
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.event_note),
                                labelText: 'Tanggal Lahir',
                              ),
                              mode: DateTimeFieldPickerMode.date,
                              autovalidateMode: AutovalidateMode.always,
                              onDateSelected: (DateTime value) {
                                print(value);
                              },
                            )),
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(),
                          child: TextFormField(
                            controller: controller.alamatC,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Alamat",
                              hintText: "Alamat",
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20.0),
                              child: const Text(
                                "Department",
                                textAlign: TextAlign.left,
                              ),
                            ),
                            RadioListTile(
                                title: const Text("Accounting"),
                                value: 'ACCOUNTING',
                                groupValue: controller.department,
                                dense: true,
                                onChanged: (value) {
                                  controller.department = value.toString();
                                }),
                            RadioListTile(
                                title: const Text("Economics"),
                                value: 'ECONOMICS',
                                dense: true,
                                groupValue: controller.department,
                                onChanged: (value) {
                                  controller.department = value.toString();
                                }),
                            RadioListTile(
                                title: const Text("Management"),
                                value: 'MANAGEMENT',
                                dense: true,
                                groupValue: controller.department,
                                onChanged: (value) {
                                  controller.department = value.toString();
                                }),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(),
                          child: TextFormField(
                            controller: controller.degreeC,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Degree",
                              hintText: "Degree",
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20.0),
                              child: const Text(
                                "Status Pekerjaan",
                                textAlign: TextAlign.left,
                              ),
                            ),
                            RadioListTile(
                                title: const Text("Belum Bekerja"),
                                value: 'BLM BEKERJA',
                                groupValue: controller.statusPekerjaan,
                                dense: true,
                                onChanged: (value) {
                                  controller.jenisKelamin = value.toString();
                                }),
                            RadioListTile(
                                title: const Text("Sudah Bekerja"),
                                value: 'SDH BEKERJA',
                                dense: true,
                                groupValue: controller.statusPekerjaan,
                                onChanged: (value) {
                                  controller.jenisKelamin = value.toString();
                                }),
                            RadioListTile(
                                title: const Text("Wiraswasta"),
                                value: 'WIRASWASTA',
                                dense: true,
                                groupValue: controller.statusPekerjaan,
                                onChanged: (value) {
                                  controller.jenisKelamin = value.toString();
                                }),
                            RadioListTile(
                                title: const Text("Lanjut Studi"),
                                value: 'LANJUT STUDI',
                                dense: true,
                                groupValue: controller.statusPekerjaan,
                                onChanged: (value) {
                                  controller.jenisKelamin = value.toString();
                                }),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(),
                              child: TextFormField(
                                controller: controller.namaPerusahaanC,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Nama Perusahaan",
                                  hintText: "Nama Perusahaan",
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
                                controller: controller.jabatanC,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Posisi / Jabatan",
                                  hintText: "Posisi / Jabatan",
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
                                controller: controller.bidangUsahaC,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Bidang usaha perusahaan",
                                  hintText: "Bidang usaha perusahaan",
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
                                controller: controller.kotaPerusahaanC,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Kota perusahaan",
                                  hintText: "Kota perusahaan",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Hero(
                  tag: "login_btn",
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size(double.infinity, 56),
                      minimumSize: const Size(double.infinity, 56),
                    ),
                    onPressed: () {
                      // controller.login();
                    },
                    child: Text(
                      "Submit".toUpperCase(),
                    ),
                  ),
                ),
              ]),
            )));
      },
    );
  }
}
