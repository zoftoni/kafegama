import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import 'package:get/get.dart';

class BeritaView extends StatelessWidget {
  const BeritaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BeritaController>(
      init: BeritaController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () => controller.handleRefresh(),
            child: Obx(() {
              return LazyLoadScrollView(
                onEndOfPage: () => controller.getData(),
                child: ListView.builder(
                  itemCount: controller.beritaList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var berita = controller.beritaList.elementAt(index);
                    return InkWell(
                      onTap: () {
                        Get.to(() => const BeritaDetailView(), arguments: [
                          {"berita": berita}
                        ]);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: IntrinsicHeight(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.cyan,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        berita.picture!,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 150,
                                    height: 100,
                                    child: Text(
                                      berita.title!,
                                      overflow: TextOverflow.fade,
                                      maxLines: 5,
                                      softWrap: true,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
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
