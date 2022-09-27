import 'package:flutter/material.dart';
import 'package:kafegama/core.dart';
import 'package:get/get.dart';
import 'package:kafegama/model/user.dart';
import 'package:kafegama/service/api_provider.dart';
import 'package:kafegama/shared/util/theme/theme.dart';

void main() async {
  Get.put(APIProvider(), permanent: true);
  Get.put(User(), permanent: true);
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: const MainView(),
    ),
  );
}
