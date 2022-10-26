import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

class IuranHistoryView extends StatelessWidget {
  const IuranHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IuranHistoryController>(
      init: IuranHistoryController(),
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
            title: const Text("IURAN HISTORY"),
          ),
          body: Obx(() {
            return Column(children: [
              Expanded(
                  child: LazyLoadScrollView(
                onEndOfPage: () => controller.getData(),
                child: RefreshIndicator(
                  onRefresh: () => controller.handleRefresh(),
                  child: ListView.separated(
                    itemCount: controller.iuranTrxList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var iuranTrx = controller.iuranTrxList.elementAt(index);
                      final numFormat = NumberFormat("#,##0", "id_ID");
                      return controller.iuranTrxList.isNotEmpty
                          ? ListTile(
                              title: Text(iuranTrx.jenis!),
                              subtitle: Text(iuranTrx.trxDate +
                                  " untuk " +
                                  iuranTrx.period +
                                  " hari"),
                              trailing: Text(
                                  numFormat.format(int.parse(iuranTrx.amount))),
                            )
                          : const SizedBox(
                              height: 20.0,
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
