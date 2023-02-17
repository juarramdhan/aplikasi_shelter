import 'package:aplikasi_shelter_bima/app/data/authcontroller..dart';
import 'package:aplikasi_shelter_bima/app/utils/appColor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';

import '../controllers/user_account_controller.dart';

class UserAccountView extends GetView<UserAccountController> {
  final authController = Get.find<AuthController>();

  UserAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 239, 239),
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primaryColor,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 150),
                      Iconify(
                        Bi.person_circle,
                        color: Colors.white,
                        size: 50,
                      ),
                      SizedBox(height: 14),
                      Container(
                          child: Column(
                        children: [
                          Text(
                            FirebaseAuth.instance.currentUser?.email ==
                                    'adminkantin@gmail.com'
                                ? "Admin kantin"
                                : '${FirebaseAuth.instance.currentUser?.displayName}',
                            style: TextStyle(
                                color: Color.fromARGB(255, 105, 104, 104),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${FirebaseAuth.instance.currentUser?.email}',
                            style: TextStyle(
                              color: Color.fromARGB(255, 105, 104, 104),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
                Container(
                  margin: context.isPhone
                      ? const EdgeInsets.only(right: 2, left: 2, top: 300)
                      : const EdgeInsets.only(right: 200, left: 200, top: 400),
                  height: 400,
                  // width: ,
                  // width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromARGB(255, 250, 250, 250)),
                  child: Stack(children: [
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 2.0, right: 2, top: 40),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Image.network(
                                            FirebaseAuth.instance.currentUser
                                                        ?.email ==
                                                    'adminkantin@gmail.com'
                                                ? "https://firebasestorage.googleapis.com/v0/b/aplikasi-kasir-shelter-bima.appspot.com/o/11362970-removebg-preview.png?alt=media&token=5412cd5f-64b2-4d6c-8716-650b12babff0"
                                                : '${FirebaseAuth.instance.currentUser?.photoURL}',
                                            height: 100),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FirebaseAuth.instance.currentUser
                                                        ?.displayName ==
                                                    null
                                                ? "Admin Kantin"
                                                : '${FirebaseAuth.instance.currentUser?.displayName}',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 105, 104, 104),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${FirebaseAuth.instance.currentUser?.email}',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 105, 104, 104),
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      authController.logout();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Color.fromARGB(
                                              255, 143, 184, 255)),
                                      child: Center(
                                        child: Text(
                                          'Logout',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 105, 104, 104),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
