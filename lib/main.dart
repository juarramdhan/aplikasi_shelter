import 'package:aplikasi_shelter_bima/app/data/authcontroller..dart';
import 'package:aplikasi_shelter_bima/app/modules/adminMenu/bindings/admin_menu_binding.dart';
import 'package:aplikasi_shelter_bima/app/modules/adminMenu/controllers/admin_menu_controller.dart';
import 'package:aplikasi_shelter_bima/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:aplikasi_shelter_bima/app/modules/home/controllers/home_controller.dart';
import 'package:aplikasi_shelter_bima/firebase_options.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController(), permanent: true);
  Get.put(HomeController(), permanent: true);
  Get.put(DashboardController(), permanent: true);
  Get.put(AdminMenuController(), permanent: true);
  runApp(StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Warung Mamah BIMA",
        initialRoute: snapshot.data != null ? Routes.DASHBOARD : Routes.LOGIN,
        getPages: AppPages.routes,
      );
    },
  ));
}
