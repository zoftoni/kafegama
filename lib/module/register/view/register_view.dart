import 'package:flutter/material.dart';
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

        return Theme(
          data: ThemeData(
            primaryColor: const Color(0xFF6F35A5),
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xFF6F35A5),
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
                                "Register",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 16.0 * 2),
                              Row(
                                children: const [
                                  Spacer(),
                                  Expanded(
                                    flex: 8,
                                    child: Text("REGISTER"),
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
                                        controller:
                                            controller.passConfirmationC,
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
          ),
        );
      },
    );
  }
}
