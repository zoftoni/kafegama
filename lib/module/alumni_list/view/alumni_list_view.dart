import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';
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
          body: RefreshIndicator(
            onRefresh: () => controller.handleRefresh(),
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
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                backgroundImage: NetworkImage(
                                  alumni.photo!,
                                ),
                              ),
                              title: Text(alumni.nama!),
                              subtitle: Text(alumni.alamat!),
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
        );
      },
    );
  }
}
