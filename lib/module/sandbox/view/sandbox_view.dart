import 'package:flutter/material.dart';
import '../controller/sandbox_controller.dart';

import 'package:get/get.dart';

class SandboxView extends StatelessWidget {
  const SandboxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SandboxController>(
      init: SandboxController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Sandbox"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: const [
                  //body
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
