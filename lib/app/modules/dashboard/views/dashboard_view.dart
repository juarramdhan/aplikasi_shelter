import 'package:aplikasi_shelter_bima/app/modules/home/views/home_view.dart';
import 'package:aplikasi_shelter_bima/app/modules/riwayat/views/riwayat_view.dart';
import 'package:aplikasi_shelter_bima/app/modules/userAccount/views/user_account_view.dart';
import 'package:aplikasi_shelter_bima/app/utils/appColor.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.selectedIndex,
            children: [
              HomeView(),
              UserAccountView(),
              RiwayatView(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          currentIndex: controller.selectedIndex,
          selectedItemColor: secondColor,
          onTap: controller.onItemTapped,
        ),
      );
    });
  }
}
