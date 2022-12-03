import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
=======
    debugShowCheckedModeBanner: false,
>>>>>>> 64c27dfbd3f4d342cc87ce52a2717fbb36d733a0
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
