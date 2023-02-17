import 'package:aplikasi_shelter_bima/app/modules/about/views/about_view.dart';
import 'package:aplikasi_shelter_bima/app/modules/adminMenu/views/admin_menu_view.dart';
import 'package:aplikasi_shelter_bima/app/modules/riwayat/views/riwayat_view.dart';
import 'package:aplikasi_shelter_bima/app/utils/appColor.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(AdminController());
    return GetBuilder<AdminController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.selectedIndex,
            children: [
              AdminMenuView(),
              AboutView(),
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
              icon: Icon(Icons.info_outline),
              label: 'About',
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
