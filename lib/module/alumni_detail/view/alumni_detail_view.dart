import 'package:flutter/material.dart';
import '../controller/alumni_detail_controller.dart';

import 'package:get/get.dart';

class AlumniDetailView extends StatelessWidget {
  const AlumniDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlumniDetailController>(
      init: AlumniDetailController(),
      builder: (controller) {
        controller.view = this;
        var alumni = controller.alumni.value;
        const styleFieldName = TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        );
        const styleFieldContent = TextStyle(
          fontSize: 18,
        );

        return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.blueGrey[800],
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title: const Text("Data Alumni"),
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxHeight: 110.0,
                  ),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blueGrey[800],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(alumni.photo!),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Nama",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                            Text(
                              alumni.nama!,
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Jenis Kelamin",
                              style: styleFieldName,
                            ),
                            SelectableText(
                              alumni.sex!,
                              style: styleFieldContent,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Alamat",
                              style: styleFieldName,
                            ),
                            SelectableText(
                              alumni.alamat!,
                              style: styleFieldContent,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Email",
                              style: styleFieldName,
                            ),
                            SelectableText(
                              alumni.email!,
                              style: styleFieldContent,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "No HP",
                              style: styleFieldName,
                            ),
                            SelectableText(
                              alumni.noHp!,
                              style: styleFieldContent,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Department",
                              style: styleFieldName,
                            ),
                            SelectableText(
                              alumni.department!,
                              style: styleFieldContent,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Degree",
                              style: styleFieldName,
                            ),
                            SelectableText(
                              alumni.degree!,
                              style: styleFieldContent,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Graduation Date",
                              style: styleFieldName,
                            ),
                            SelectableText(
                              alumni.graduationDate!,
                              style: styleFieldContent,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Status Pekerjaan",
                              style: styleFieldName,
                            ),
                            SelectableText(
                              alumni.statusPekerjaan!,
                              style: styleFieldContent,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Nama Perusahaan",
                              style: styleFieldName,
                            ),
                            SelectableText(
                              alumni.namaPerusahaan!,
                              style: styleFieldContent,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Bidang Usaha Perusahaan",
                              style: styleFieldName,
                            ),
                            SelectableText(
                              alumni.bidangUsahaPerusahaan ?? "",
                              style: styleFieldContent,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Kota Perusahaan",
                              style: styleFieldName,
                            ),
                            SelectableText(
                              alumni.kotaTempatKerja!,
                              style: styleFieldContent,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
