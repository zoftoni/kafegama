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

        return Theme(
          data: ThemeData(
            primaryColor: const Color(0xFF6F35A5),
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: const Color(0xFF6F35A5),
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Color(0xFFF1E6FF),
              iconColor: Color(0xFF6F35A5),
              prefixIconColor: Color(0xFF6F35A5),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
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
                              const Text(
                                "LOGIN",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 16.0 * 2),
                              Row(
                                children: const [
                                  Spacer(),
                                  Expanded(
                                    flex: 8,
                                    child: Text("LOGO"),
                                  ),
                                  Spacer(),
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
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          const Text(
                                            "Belum punya akun ? ",
                                            style: TextStyle(
                                                color: Color(0xFF6F35A5)),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(const RegisterView());
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          const Text(
                                            "Lupa Password ? ",
                                            style: TextStyle(
                                                color: Color(0xFF6F35A5)),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                  const ForgotPasswordView());
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
