import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';

import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
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
            title: const Text("LOGIN"),
          ),
          body: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            "assets/image/bglogin.png",
                            width: double.infinity,
                            height: 200.0,
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
                  Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 8,
                        child: Form(
                          child: Column(
                            children: [
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
                                    child: Icon(Icons.person),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: TextFormField(
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
                              ),
                              const SizedBox(height: 16.0),
                              Hero(
                                tag: "login_btn",
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    maximumSize:
                                        const Size(double.infinity, 56),
                                    minimumSize:
                                        const Size(double.infinity, 56),
                                  ),
                                  onPressed: () {
                                    controller.login();
                                  },
                                  child: Text(
                                    "Login".toUpperCase(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    "Belum punya akun ? ",
                                    style: TextStyle(color: Color(0xFF6F35A5)),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.openRegister();
                                    },
                                    child: const Text(
                                      "Register",
                                      style: TextStyle(
                                        color: Color(0xFF6F35A5),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    "Lupa Password ? ",
                                    style: TextStyle(color: Color(0xFF6F35A5)),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(controller.openResetPassword());
                                    },
                                    child: const Text(
                                      "Reset Password",
                                      style: TextStyle(
                                        color: Color(0xFF6F35A5),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
        );
      },
    );
  }
}
