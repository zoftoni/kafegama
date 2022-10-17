import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';
import 'package:get/get.dart';

class ProfilView extends StatelessWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilController>(
      init: ProfilController(),
      builder: (controller) {
        controller.view = this;
        const styleFieldName = TextStyle(
          fontSize: 12,
        );
        const styleFieldContent = TextStyle(
          fontSize: 18,
        );

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            flexibleSpace: const AppBarBG(),
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title: const Text("MY PROFILE"),
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Obx(
              () {
                var alumni = controller.alumni.value;
                return Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints(
                        maxHeight: 110.0,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(214, 41, 118, 1),
                              Color.fromRGBO(150, 47, 191, 1)
                            ]),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Row(
                        children: [
                          alumni.photo != null
                              ? CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(alumni.photo!),
                                )
                              : const CircleAvatar(
                                  radius: 30.0,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage("assets/image/kafegama.png"),
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
                                alumni.nama != null
                                    ? Text(
                                        alumni.nama!,
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const SizedBox(
                                        height: 10.0,
                                      ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Angkatan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                ),
                              ),
                              alumni.angkatanTahun != null
                                  ? Text(
                                      alumni.angkatanTahun!.toString(),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const SizedBox(
                                      height: 10.0,
                                    ),
                            ],
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
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Jenis Kelamin",
                              style: styleFieldName,
                            ),
                            alumni.sex != null
                                ? SelectableText(
                                    alumni.sex!,
                                    style: styleFieldContent,
                                  )
                                : const SizedBox(
                                    height: 10.0,
                                  ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Alamat",
                              style: styleFieldName,
                            ),
                            alumni.alamat != null
                                ? SelectableText(
                                    alumni.alamat!,
                                    style: styleFieldContent,
                                  )
                                : const SizedBox(
                                    height: 10.0,
                                  ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Email",
                              style: styleFieldName,
                            ),
                            alumni.email != null
                                ? SelectableText(
                                    alumni.email!,
                                    style: styleFieldContent,
                                  )
                                : const SizedBox(
                                    height: 10.0,
                                  ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "No HP",
                              style: styleFieldName,
                            ),
                            alumni.noHp != null
                                ? SelectableText(
                                    alumni.noHp!,
                                    style: styleFieldContent,
                                  )
                                : const SizedBox(
                                    height: 10.0,
                                  ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Department",
                              style: styleFieldName,
                            ),
                            alumni.department != null
                                ? SelectableText(
                                    alumni.department!,
                                    style: styleFieldContent,
                                  )
                                : const SizedBox(
                                    height: 10.0,
                                  ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Degree",
                              style: styleFieldName,
                            ),
                            alumni.degree != null
                                ? SelectableText(
                                    alumni.degree!,
                                    style: styleFieldContent,
                                  )
                                : const SizedBox(
                                    height: 10.0,
                                  ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Lulusan Tahun",
                              style: styleFieldName,
                            ),
                            alumni.lulusanTahun != null
                                ? SelectableText(
                                    alumni.lulusanTahun!.toString(),
                                    style: styleFieldContent,
                                  )
                                : const SizedBox(
                                    height: 10.0,
                                  ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Status Pekerjaan",
                              style: styleFieldName,
                            ),
                            alumni.statusPekerjaan != null
                                ? SelectableText(
                                    alumni.statusPekerjaan!,
                                    style: styleFieldContent,
                                  )
                                : const SizedBox(
                                    height: 10.0,
                                  ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Nama Perusahaan",
                              style: styleFieldName,
                            ),
                            alumni.namaPerusahaan != null
                                ? SelectableText(
                                    alumni.namaPerusahaan!,
                                    style: styleFieldContent,
                                  )
                                : const SizedBox(
                                    height: 10.0,
                                  ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Bidang Usaha Perusahaan",
                              style: styleFieldName,
                            ),
                            alumni.bidangUsahaPerusahaan != null
                                ? SelectableText(
                                    alumni.bidangUsahaPerusahaan ?? "",
                                    style: styleFieldContent,
                                  )
                                : const SizedBox(
                                    height: 10.0,
                                  ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Kota Perusahaan",
                              style: styleFieldName,
                            ),
                            alumni.kotaTempatKerja != null
                                ? SelectableText(
                                    alumni.kotaTempatKerja!,
                                    style: styleFieldContent,
                                  )
                                : const SizedBox(
                                    height: 10.0,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
