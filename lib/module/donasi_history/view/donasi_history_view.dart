import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

class DonasiHistoryView extends StatelessWidget {
  const DonasiHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DonasiHistoryController>(
      init: DonasiHistoryController(),
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
            title: const Text("DONASI HISTORY"),
          ),
          body: Obx(() {
            return Column(children: [
              Expanded(
                  child: LazyLoadScrollView(
                onEndOfPage: () => controller.getData(),
                child: RefreshIndicator(
                  onRefresh: () => controller.handleRefresh(),
                  child: ListView.separated(
                    itemCount: controller.donasiTrxList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var donasiTrx = controller.donasiTrxList.elementAt(index);
                      final numFormat = NumberFormat("#,##0", "id_ID");
                      return ListTile(
                        title: Text(donasiTrx.campaign!),
                        subtitle: Text(donasiTrx.trxDate ?? ""),
                        trailing:
                            Text(numFormat.format(int.parse(donasiTrx.amount))),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
                ),
              )),
              Container(
                  child: (controller.isLoading.value)
                      ? const Padding(
                          padding: EdgeInsets.all(20),
                          child: CircularProgressIndicator())
                      : Row())
            ]);
          }),
        );
      },
    );
  }
}
