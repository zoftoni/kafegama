import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';
import 'package:kafegama/shared/util/theme/appbar_bg.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import 'package:get/get.dart';

class AlumniListView extends StatelessWidget {
  const AlumniListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlumniListController>(
      init: AlumniListController(),
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
              title: const Text("DAFTAR ALUMNI"),
            ),
            body: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[400]!,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.search),
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: null,
                          decoration: const InputDecoration.collapsed(
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: "Search",
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.sort,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Obx(() {
                  return LazyLoadScrollView(
                    onEndOfPage: () => controller.getData(),
                    child: ListView.builder(
                      itemCount: controller.alumniList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var alumni = controller.alumniList.elementAt(index);
                        return InkWell(
                          onTap: () {
                            Get.to(() => const AlumniDetailView(), arguments: [
                              {"alumni": alumni}
                            ]);
                          },
                          child: ListView.builder(
                            itemCount: controller.alumniList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 5,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.grey[200],
                                    backgroundImage: NetworkImage(
                                      alumni.photo!,
                                    ),
                                  ),
                                  title: Text(alumni.nama!),
                                  subtitle: Text(alumni.alamat!),
                                  trailing: const Text("1995"),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ]));
      },
    );
  }
}
