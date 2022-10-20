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
            title: const Text("DONASI"),
          ),
          body: Obx(() {
            return Column(children: [
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
                          onFieldSubmitted: (value) =>
                              {controller.search(value)},
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
                  child: LazyLoadScrollView(
                onEndOfPage: () => controller.getData(),
                child: RefreshIndicator(
                  onRefresh: () => controller.handleRefresh(),
                  child: ListView.builder(
                    itemCount: controller.donasiTrxList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var donasiTrx = controller.donasiTrxList.elementAt(index);
                      final numFormat = NumberFormat("#,##0", "id_ID");
                      return ListTile(
                        title: Text(donasiTrx.campaign!),
                        subtitle: Text(donasiTrx.trxDate),
                        trailing:
                            Text(numFormat.format(int.parse(donasiTrx.amount))),
                      );
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
