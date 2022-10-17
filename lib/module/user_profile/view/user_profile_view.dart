import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';

import 'package:get/get.dart';

class UserProfileView extends StatelessWidget {
  final MainController mainController;
  const UserProfileView({Key? key, required this.mainController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
        init: UserProfileController(mainController),
        builder: (controller) {
          controller.view = this;

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              flexibleSpace: const AppBarBG(),
              centerTitle: true,
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              title: const Text("USER MENU"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Obx(() {
                    var user = controller.user.value;
                    return Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 24,
                                offset: Offset(0, 11),
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              user.nim == null
                                  ? InkWell(
                                      onTap: () {
                                        Get.delete<UserProfileController>();
                                        Get.to(() => const VerifNimView());
                                      },
                                      child: MenuItem(
                                          Icons.verified, "Verifikasi NIM", ""))
                                  : Column(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              controller.openProfile();
                                            },
                                            child: MenuItem(
                                                Icons.person, "Profil", "")),
                                        InkWell(
                                            onTap: () {
                                              controller.openEditProfile();
                                            },
                                            child: MenuItem(Icons.list_alt,
                                                "Edit Profil", "")),
                                        InkWell(
                                            onTap: () {
                                              controller.openProfile();
                                            },
                                            child: MenuItem(
                                                Icons.card_membership,
                                                "Membership",
                                                "GOLD")),
                                      ],
                                    ),
                              InkWell(
                                  onTap: () {
                                    controller.openProfile();
                                  },
                                  child: MenuItem(
                                      Icons.list, "Riwayat Donasi", "")),
                              InkWell(
                                  onTap: () {
                                    controller.openProfile();
                                  },
                                  child: MenuItem(
                                      Icons.question_answer_outlined,
                                      "FAQ",
                                      "")),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        InkWell(
                          onTap: () => controller.logout(),
                          child: const Text(
                            "LOGOUT",
                            style: TextStyle(
                              color: Color.fromRGBO(150, 47, 191, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    );
                  })),
            ),
          );
        });
  }
}

// ignore: non_constant_identifier_names
Widget MenuItem(var settingIcon, var heading, var subheading) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(150, 47, 191, 1),
              ),
              width: 45,
              height: 45,
              padding: const EdgeInsets.all(4),
              child: Icon(settingIcon, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  heading,
                ),
                subheading != ""
                    ? Text(
                        subheading,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      )
                    : const SizedBox(
                        height: 1.0,
                      ),
              ],
            ),
          ],
        ),
        const Icon(Icons.keyboard_arrow_right, color: Colors.purpleAccent)
      ],
    ),
  );
}
