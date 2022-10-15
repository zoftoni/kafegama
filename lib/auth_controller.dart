import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:kafegama/core.dart';
import 'package:kafegama/splash_screen.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateBasedOnLogin();
  }

  Future<void> _navigateBasedOnLogin() async {
    SessionManager().containsKey("USER").then((value) {
      if (value) {
        Get.off(() => const MainView());
      } else {
        Get.off(() => const SplashScreen());
      }
    });
  }
}
