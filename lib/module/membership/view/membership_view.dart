import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import 'package:get/get.dart';

class MembershipView extends StatelessWidget {
  const MembershipView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MembershipController>(
      init: MembershipController(),
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
              title: const Text("MEMBERSHIP"),
            ),
            body: Column(children: [
              Expanded(
                child: Obx(() {
                  return controller.isLoading.value
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Center(child: Text("..loading...")),
                        )
                      : LazyLoadScrollView(
                          onEndOfPage: () => controller.getData(),
                          child: RefreshIndicator(
                            onRefresh: () => controller.handleRefresh(),
                            child: ListView.builder(
                              itemCount: controller.membershipList.length,
                              itemBuilder: (BuildContext context, int index) {
                                var membership =
                                    controller.membershipList.elementAt(index);
                                return InkWell(
                                    onTap: () {
                                      // Get.to(() => const DonasiCampaignDetailView(),
                                      //     arguments: [
                                      //       {"donasiCampaign": donasiCampaign}
                                      //     ]);
                                    },
                                    child: Card(
                                      elevation: 5,
                                      child: ListTile(
                                        leading: Image.network(membership.img!),
                                        title: Text(membership.title!),
                                        subtitle: Text(membership.desc!),
                                      ),
                                    ));
                              },
                            ),
                          ),
                        );
                }),
              ),
            ]));
      },
    );
  }
}
