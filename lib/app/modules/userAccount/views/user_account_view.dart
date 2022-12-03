import 'package:aplikasi_shelter_bima/app/utils/appColor.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';

import '../controllers/user_account_controller.dart';

class UserAccountView extends GetView<UserAccountController> {
  const UserAccountView({Key? key}) : super(key: key);
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
                            "Juar Ramadhan",
                            style: TextStyle(
                                color: Color.fromARGB(255, 105, 104, 104),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "JuarRamadhan@gmail.com",
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
                      ? const EdgeInsets.only(right: 50, left: 50, top: 400)
                      : const EdgeInsets.only(right: 200, left: 200, top: 400),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromARGB(255, 250, 250, 250)),
                  child: Stack(children: [
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20, top: 40),
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Image.asset(
                                            'assets/images/profile.jpg',
                                            height: 120),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Juar Ramadahan",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 105, 104, 104),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Juar@mail.com",
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
