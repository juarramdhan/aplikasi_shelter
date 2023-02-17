import 'package:aplikasi_shelter_bima/app/data/halaman/makanan.dart';
import 'package:aplikasi_shelter_bima/app/data/halaman/minuman.dart';
import 'package:aplikasi_shelter_bima/app/utils/appColor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<HomeController>(builder: (controller) {
      return SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/mie.jpg"),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 280),
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            print("object");
                            controller.changeTabIndex(0);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: controller.tab == 0
                                  ? secondColor
                                  : primaryColor,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.fastfood,
                                  color: controller.tab == 0
                                      ? Colors.white
                                      : Colors.black,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Makanan",
                                  style: TextStyle(
                                    color: controller.tab == 0
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        InkWell(
                          onTap: () {
                            print("object");
                            controller.changeTabIndex(1);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: controller.tab == 1
                                  ? secondColor
                                  : primaryColor,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.local_drink,
                                  color: controller.tab == 1
                                      ? Colors.white
                                      : Colors.black,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Minuman",
                                  style: TextStyle(
                                    color: controller.tab == 1
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //
                  Container(
                    child: [Makanan(), Minuman()][controller.tab],
                  ),

//
                ],
              ),
            ),
          ],
        ),
      ));
    }));
  }
}
