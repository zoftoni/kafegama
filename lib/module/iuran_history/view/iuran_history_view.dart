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
              title: const Text("IURAN MEMBERSHIP"),
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
                    child: RefreshIndicator(
                      onRefresh: () => controller.handleRefresh(),
                      child: ListView.builder(
                        itemCount: controller.iuranTrxList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var iuranTrx =
                              controller.iuranTrxList.elementAt(index);
                          final numFormat = NumberFormat("#,##0", "id_ID");
                          return controller.iuranTrxList.isNotEmpty
                              ? ListTile(
                                  title: Text(iuranTrx.jenis!),
                                  subtitle: Text(iuranTrx.trxDate +
                                      " untuk " +
                                      iuranTrx.period +
                                      " hari"),
                                  trailing: Text(numFormat
                                      .format(int.parse(iuranTrx.amount))),
                                )
                              : const SizedBox(
                                  height: 20.0,
                                );
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
