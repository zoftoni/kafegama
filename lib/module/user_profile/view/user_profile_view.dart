import 'package:flutter/material.dart';
import 'package:kafegama/module/main/controller/main_controller.dart';
import '../controller/user_profile_controller.dart';

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

        /*
        ------------------------
        https://capekngoding.com
        ------------------------
        Starring:
        Name: Dicky Darmawan
        Github: https://github.com/Dicky019
        ------------------------
        -
        ------------------------
        Code generation with snippets can be a good solution for you or it can kill you.
        A basic understanding of Dart and Flutter is required.
        Keep it in mind, Our snippet can't generate many files yet.
        So, all of our snippets are put in one file which is not best practice.
        You need to do the optimization yourself, and at least you are familiar with using Flutter.
        ------------------------
        */

        return Scaffold(
          backgroundColor: const Color(0xffF3F5F9),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.grey[900],
            ),
            titleTextStyle: TextStyle(
              color: Colors.grey[900],
            ),
            title: const Text("Profile"),
            actions: [
              IconButton(
                onPressed: () {
                  controller.logout();
                },
                icon: const Icon(
                  Icons.logout,
                  size: 24.0,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(124 / 2),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 24,
                            offset: const Offset(0, 8),
                            spreadRadius: 8)
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 42.0,
                        backgroundImage: NetworkImage(
                          "https://i.ibb.co/tXncffL/photo-1487017159836-4e23ece2e4cf-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Marjorie Hawkins',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Card(
                          color: Color(0xff34C759),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 12.0,
                              right: 12.0,
                              top: 4.0,
                              bottom: 4.0,
                            ),
                            child: Text(
                              "Class: 7B",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Card(
                          color: Color(0xffAF52DE),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 12.0,
                              right: 12.0,
                              top: 4.0,
                              bottom: 4.0,
                            ),
                            child: Text(
                              "Profile: Maths, Physics",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
