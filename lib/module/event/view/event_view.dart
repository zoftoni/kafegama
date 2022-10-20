import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import 'package:get/get.dart';

class EventView extends StatelessWidget {
  const EventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
      init: EventController(),
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
              title: const Text("EVENT"),
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
                child: Obx(() {
                  return LazyLoadScrollView(
                    onEndOfPage: () => controller.getData(),
                    isLoading: controller.isLoading.value,
                    child: RefreshIndicator(
                      onRefresh: () => controller.handleRefresh(),
                      child: ListView.builder(
                        itemCount: controller.eventList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var event = controller.eventList.elementAt(index);
                          return InkWell(
                            onTap: () {
                              Get.to(() => const EventDetailView(), arguments: [
                                {"event": event}
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.cyan,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              event.picture!,
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
                                            event.title!,
                                            overflow: TextOverflow.fade,
                                            maxLines: 5,
                                            softWrap: true,
                                            style:
                                                const TextStyle(fontSize: 14),
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
                    ),
                  );
                }),
              ),
              Container(
                  child: (controller.isLoading.value)
                      ? const Padding(
                          padding: EdgeInsets.all(20),
                          child: CircularProgressIndicator())
                      : Row())
            ]));
      },
    );
  }
}
