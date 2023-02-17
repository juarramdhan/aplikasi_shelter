import 'package:aplikasi_shelter_bima/app/data/authcontroller..dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  AboutView({Key? key}) : super(key: key);
  final aoi = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AboutView'),
        centerTitle: true,
      ),
      body: Container(
        // height: 30,
        padding: EdgeInsets.only(top: 300),
        alignment: Alignment.bottomCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 70, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'PAM PROJECT',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Text(
                    'Nata SUkma Nursafari',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Juar Ramdahan',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Muhammad Michael Musthafa',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  // sha(context);
                  aoi.logout();
                },
                child: Container(
                  width: 120,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
