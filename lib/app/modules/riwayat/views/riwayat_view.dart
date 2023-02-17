import 'package:aplikasi_shelter_bima/app/data/riwayatPesan.dart';
import 'package:aplikasi_shelter_bima/app/utils/appColor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  margin: EdgeInsets.only(top: 400),
                  // height: 500,
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
                                left: 20.0, right: 20, top: 100),
                            child: Container(
                              // width: 200,
                              child: StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('pesanan_makanan')
                                      .where('p',
                                          isEqualTo: FirebaseAuth
                                              .instance.currentUser?.email)
                                      .snapshots(),
                                  builder: (__,
                                      AsyncSnapshot<
                                              QuerySnapshot<
                                                  Map<String, dynamic>>>
                                          snapshot) {
                                    if (snapshot.hasError) {
                                      return Text(
                                        "eor",
                                        style: TextStyle(
                                            fontSize: 100,
                                            color:
                                                Color.fromARGB(255, 226, 7, 7)),
                                      );
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text(
                                        "Loading",
                                        style: TextStyle(color: Colors.white),
                                      );
                                    }
                                    final rp = snapshot.requireData;
                                    return ListView.builder(
                                      itemCount: rp.size,
                                      scrollDirection: Axis.vertical,
                                      physics: ScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                            onTap: () {},
                                            child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 1, left: 1),
                                                margin:
                                                    EdgeInsets.only(bottom: 8),
                                                height: Get.height * 0.14,
                                                width: Get.width * 0.7,
                                                decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 23),
                                                      child: Row(children: [
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Image.network(
                                                              rp.docs[index]
                                                                      ['gmb']
                                                                  .toString(),
                                                              height: 70,
                                                            ),
                                                            SizedBox(
                                                                height:
                                                                    Get.height *
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
                                                                  rp.docs[index]
                                                                      ['nama'],
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          105,
                                                                          104,
                                                                          104),
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(top: 1),
                                                              child: Row(
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Keterangan : ",
                                                                        style: TextStyle(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            fontSize:
                                                                                15),
                                                                      ),
                                                                      Text(
                                                                        rp.docs[index]
                                                                            [
                                                                            'keterangan'],
                                                                        style: TextStyle(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                5,
                                                                                5,
                                                                                5),
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
                                                              EdgeInsets.all(
                                                                  12),
                                                          alignment:
                                                              Alignment.center,
                                                          height: 80,
                                                          child: Text(
                                                            'Rp.' +
                                                                rp.docs[index]
                                                                        ['hr']
                                                                    .toString(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    seocndText,
                                                                fontSize: 18),
                                                          ),
                                                        ),
                                                      ]),
                                                    ),
                                                  ],
                                                )));
                                      },
                                      // SizedBox(height: Get.height * 0.01),
                                    );
                                  }),
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
