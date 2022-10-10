import 'package:flutter/material.dart';
import 'package:kafegama/shared/util/theme/appbar_bg.dart';
import '../controller/register_controller.dart';

import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            elevation: 0.0,
            flexibleSpace: const AppBarBG(),
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title: const Text("Daftar"),
          ),
          body: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                      "assets/image/bgregister.png",
                                      width: double.infinity,
                                      height: 210.0,
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
                                const SizedBox(height: 16.0 * 2),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Expanded(
                              flex: 8,
                              child: Form(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      controller: controller.nameC,
                                      cursorColor: const Color(0xFF6F35A5),
                                      onSaved: (name) {},
                                      decoration: const InputDecoration(
                                        hintText: "nama",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(Icons.person),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      controller: controller.emailC,
                                      cursorColor: const Color(0xFF6F35A5),
                                      onSaved: (email) {},
                                      decoration: const InputDecoration(
                                        hintText: "email",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(Icons.email),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    TextFormField(
                                      textInputAction: TextInputAction.done,
                                      controller: controller.passC,
                                      obscureText: true,
                                      cursorColor: const Color(0xFF6F35A5),
                                      decoration: const InputDecoration(
                                        hintText: "password",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(Icons.lock),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    TextFormField(
                                      textInputAction: TextInputAction.done,
                                      controller: controller.passConfirmationC,
                                      obscureText: true,
                                      cursorColor: const Color(0xFF6F35A5),
                                      decoration: const InputDecoration(
                                        hintText: "confirm password",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(Icons.lock),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    Hero(
                                      tag: "register_btn",
                                      child: ElevatedButton(
                                        onPressed: () {
                                          controller.register();
                                        },
                                        child: Text(
                                          "Register".toUpperCase(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
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
