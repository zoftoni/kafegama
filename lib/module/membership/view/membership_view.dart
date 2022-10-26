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
            body: Obx(() {
              return Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 65.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey[900]!,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10.0,
                            ),
                            const Text(
                              "Status Membership : ",
                            ),
                            Text(controller.user.value.statusAnggota != null
                                ? controller.user.value.statusAnggota! +
                                    " MEMBER"
                                : ""),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10.0,
                            ),
                            const Text(
                              "Expiration Date : ",
                            ),
                            Text(controller
                                    .user.value.statusAnggotaExpiredDate ??
                                ""),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: controller.isLoading.value
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
                                  var membership = controller.membershipList
                                      .elementAt(index);
                                  return InkWell(
                                      onTap: () {
                                        Get.to(() => const IuranPaymentView(),
                                            arguments: [
                                              {"jenis_anggota": membership}
                                            ]);
                                      },
                                      child: Card(
                                        elevation: 5,
                                        child: ListTile(
                                          leading:
                                              Image.network(membership.img!),
                                          title: Text(membership.title!),
                                          subtitle: Text(membership.desc!),
                                        ),
                                      ));
                                },
                              ),
                            ),
                          )),
              ]);
            }));
      },
    );
  }
}
