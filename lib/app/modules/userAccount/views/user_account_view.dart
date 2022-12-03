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
        body: Container(
      child: Stack(
        children: [
          Container(
            height: 500,
            width: 600,
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
            margin: EdgeInsets.only(left: 42, top: 400),
            height: 300,
            width: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.red),
            child: Stack(children: []),
          )
        ],
      ),
    ));
  }
}
