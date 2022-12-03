import 'package:aplikasi_shelter_bima/app/data/riwayatPesan.dart';
import 'package:aplikasi_shelter_bima/app/utils/appColor.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';

import '../controllers/riwayat_controller.dart';

class RiwayatView extends GetView<RiwayatController> {
  const RiwayatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 500,
                width: 600,
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 120),
                    Iconify(
                      Bi.cart,
                      color: Colors.white,
                      size: 80,
                    ),
                    SizedBox(height: 16),
                    Container(
                        child: Column(
                      children: [
                        Text(
                          "Riwayat Pemesananmu",
                          style: TextStyle(
                              color: Color.fromARGB(255, 105, 104, 104),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Mohon tunggu & selamat menikmati",
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
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 300),
                  // height: 800,
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 250, 250, 250)),
                  child: Stack(children: [
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20, top: 40),
                            child: Container(
                              child: Container(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 5),
                                // width: Get.width * 0.98,
                                // height: Get.width * 0.80,
                                // height: MediaQuery.of(context).size.height * 0.3,
                                child: ListView.builder(
                                  itemCount: 4,
                                  scrollDirection: Axis.vertical,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () {},
                                        child: Container(
                                            padding: const EdgeInsets.only(
                                                top: 1, left: 1),
                                            margin: EdgeInsets.only(bottom: 8),
                                            height: Get.height * 0.14,
                                            width: Get.width * 0.7,
                                            decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 23),
                                                  child: Row(children: [
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image.asset(
                                                          riwayat[index]
                                                              ['image'],
                                                          height: 70,
                                                        ),
                                                        SizedBox(
                                                            height: Get.height *
                                                                0.01),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              riwayat[index]
                                                                  ['namaMenu'],
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          105,
                                                                          104,
                                                                          104),
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1),
                                                          child: Row(
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    riwayat[index]
                                                                        [
                                                                        'inklud'][0],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15),
                                                                  ),
                                                                  Text(
                                                                    riwayat[index]
                                                                        [
                                                                        'inklud'][1],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 12,
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(12),
                                                      alignment:
                                                          Alignment.center,
                                                      height: 80,
                                                      child: Text(
                                                        'Rp.' +
                                                            riwayat[index]
                                                                ['harga'],
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: seocndText,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                              ],
                                            )));
                                  },
                                  // SizedBox(height: Get.height * 0.01),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              )
            ],
          ),
        ],
      ),
    )));
  }
}
