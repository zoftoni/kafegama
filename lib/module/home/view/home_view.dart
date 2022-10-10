import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';
import 'package:kafegama/model/berita/berita_list.dart';
import 'package:kafegama/model/donasi_campaign/donasi_campaign_list.dart';
import 'package:kafegama/model/event/event_list.dart';
import 'package:kafegama/shared/util/theme/appbar_bg.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
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
            title: const Text("BERANDA"),
          ),
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () => controller.handleRefresh(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              "assets/image/homeatmontain.jpg",
                              width: double.infinity,
                              height: 150.0,
                              fit: BoxFit.cover,
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 50.0,
                                ),
                                Image.asset(
                                  "assets/image/logo.png",
                                  width: double.infinity,
                                  height: 80.0,
                                  alignment: Alignment.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    //
                    //Header
                    //
                    Obx(() {
                      var user = controller.user.value;
                      return user.id == null
                          ? Container(
                              width: double.infinity,
                              height: 80,
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        controller.openLogin();
                                      },
                                      child: const Text("Login"),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              width: double.infinity,
                              height: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                        'https://i.ibb.co/PGv8ZzG/me.jpg',
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Hi," + user.name!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                    }),
                    //
                    //Event
                    //
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Event",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.to(() => const EventView());
                                      },
                                      child: const Text(
                                        "Lihat Semua",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.purpleAccent,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Obx(() {
                                var eventList = controller.eventList.value;
                                return controller.isLoading.value
                                    ? SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: const Center(
                                            child: Text("..loading...")),
                                      )
                                    : eventList.error == null
                                        ? EventListView(eventList: eventList)
                                        : Text(eventList.error!);
                              }),
                            ])),
                    const SizedBox(height: 10),

                    //
                    //Berita
                    //
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Berita",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.to(() => const BeritaView());
                                      },
                                      child: const Text(
                                        "Lihat Semua",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.purpleAccent,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Obx(() {
                                var beritaList = controller.beritaList.value;
                                return controller.isLoading.value
                                    ? SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: const Center(
                                            child: Text("..loading...")),
                                      )
                                    : beritaList.error == null
                                        ? BeritaListView(beritaList: beritaList)
                                        : Text(beritaList.error!);
                              }),
                            ])),
                    const SizedBox(height: 10),

                    //
                    //Donasi
                    //
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Donasi",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.to(
                                            () => const DonasiCampaignView());
                                      },
                                      child: const Text(
                                        "Lihat Semua",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.purpleAccent,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Obx(() {
                                var donasiCampaignList =
                                    controller.donasiCampaignList.value;
                                return controller.isLoading.value
                                    ? SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: const Center(
                                            child: Text("..loading...")),
                                      )
                                    : donasiCampaignList.error == null
                                        ? DonasiCampaignListView(
                                            donasiCampaignList:
                                                donasiCampaignList)
                                        : Text(donasiCampaignList.error!);
                              }),
                            ])),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class BeritaListView extends StatelessWidget {
  const BeritaListView({
    Key? key,
    required this.beritaList,
  }) : super(key: key);

  final BeritaList beritaList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: beritaList.data?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var berita = beritaList.data?.elementAt(index);
          return berita == null
              ? const SizedBox(height: 10)
              : InkWell(
                  onTap: () {
                    Get.to(() => const BeritaDetailView(), arguments: [
                      {"berita": berita}
                    ]);
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              width: 300,
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
                                width: 300,
                                height: 50,
                                child: Text(
                                  berita.title!,
                                  overflow: TextOverflow.clip,
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
  }
}

class EventListView extends StatelessWidget {
  const EventListView({
    Key? key,
    required this.eventList,
  }) : super(key: key);

  final EventList eventList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: eventList.data?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var event = eventList.data?.elementAt(index);
          return event == null
              ? const SizedBox(height: 10)
              : InkWell(
                  onTap: () {
                    Get.to(() => const EventDetailView(), arguments: [
                      {"event": event}
                    ]);
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
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
                                width: 300,
                                height: 50,
                                child: Text(
                                  event.title!,
                                  overflow: TextOverflow.clip,
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
  }
}

class DonasiCampaignListView extends StatelessWidget {
  const DonasiCampaignListView({
    Key? key,
    required this.donasiCampaignList,
  }) : super(key: key);

  final DonasiCampaignList donasiCampaignList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: donasiCampaignList.data?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var donasiCampaign = donasiCampaignList.data?.elementAt(index);
          return donasiCampaign == null
              ? const SizedBox(height: 10)
              : InkWell(
                  onTap: () {
                    Get.to(() => const DonasiCampaignDetailView(), arguments: [
                      {"donasiCampaign": donasiCampaign}
                    ]);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.cyan,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    donasiCampaign.picture!,
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
                                  donasiCampaign.title!,
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
  }
}
