import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';

import 'package:get/get.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int selectedIndex = 0;

    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: TabBarView(
            controller: controller.tabController,
            children: [
              const HomeView(),
              const AlumniListView(),
              const BursaKerjaView(),
              UserProfileView(mainController: controller)
            ],
          ),
          bottomNavigationBar: Container(
            color: const Color.fromRGBO(150, 47, 191, 1),
            child: TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: const TextStyle(fontSize: 10.0),
              controller: controller.tabController,
              tabs: const [
                Tab(
                  text: "Home",
                  icon: Icon(
                    Icons.home,
                  ),
                ),
                Tab(
                  text: "Alumni",
                  icon: Icon(
                    Icons.list_alt,
                  ),
                ),
                Tab(
                  text: "Bursa Kerja",
                  icon: Icon(
                    Icons.work,
                  ),
                ),
                Tab(
                  text: "User",
                  icon: Icon(
                    Icons.person,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
