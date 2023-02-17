import 'package:aplikasi_shelter_bima/app/utils/appColor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:status_alert/status_alert.dart';

import '../controllers/admin_menu_controller.dart';

class AdminMenuView extends GetView<AdminMenuController> {
  const AdminMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 239, 239),
        body: Container(
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
                    SizedBox(height: 50),
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
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            sha(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              'Tambah Menu',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
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
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('makanan')
                                .snapshots(),
                            builder: (__,
                                AsyncSnapshot<
                                        QuerySnapshot<Map<String, dynamic>>>
                                    snapshot) {
                              if (snapshot.hasError) {
                                return Text(
                                  "eor",
                                  style: TextStyle(
                                      fontSize: 100,
                                      color: Color.fromARGB(255, 226, 7, 7)),
                                );
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text(
                                  "Loading",
                                  style: TextStyle(color: Colors.white),
                                );
                              }
                              final makanan = snapshot.requireData;
                              return ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: makanan.size,
                                  itemBuilder: (context, int index) {
                                    return Flexible(
                                      flex: 1,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        width: double.infinity,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 3,
                                                color: Colors.grey,
                                                offset: Offset(0, 3))
                                          ],
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 80,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: NetworkImage(makanan
                                                        .docs[index]['foto']
                                                        .toString()),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Container(
                                                width: 100,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        '${makanan.docs[index]['nama']}',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                    Text(
                                                      '${makanan.docs[index]['deskripsi']}',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    ),
                                                    Text(
                                                      'Rp. ${makanan.docs[index]['harga']},',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  showModalPesen(
                                                      context, index, makanan);
                                                  print(
                                                      "Edit ${makanan.docs[index]['nama']}");
                                                },
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      color: primaryColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(10),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  child: const Center(
                                                    child: Text(
                                                      "Aksi",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: Colors.green),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            }),
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
        ));
  }

  Future<void> sha(BuildContext context) {
    final AdminMenuController c = Get.find();
    final List<String> items = [
      'Makanan',
      'Minuman',
    ];
    String? selectedValue;

    // final _gambarController = controller.file_im;
    final _nmC = TextEditingController();
    final _ktC = TextEditingController();
    final _hrF = TextEditingController();
    final _kt = TextEditingController();

    var _p = FirebaseAuth.instance.currentUser?.email;
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 600,
              width: 100,
              padding: const EdgeInsets.all(20),
              // color: Colors.amber,
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tambah Menu",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'monday-feelings-font',
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            c.ui();
                          },
                          child: GetBuilder<AdminMenuController>(
                            init: AdminMenuController(),
                            initState: (_) {},
                            builder: (_) {
                              return Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.image,
                                      size: 40,
                                    ),
                                    Text(c.fil == ""
                                        ? "masukkan gambar"
                                        : "seleted")
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _nmC,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nama Menu',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _hrF,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Harga detail',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _kt,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Kategori detail',
                              hintText: "makanan atau minuman"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          // minLines: 4,
                          maxLines: 2,
                          controller: _ktC,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'tambah Keterangan',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            secondColor),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ))),
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('makanan')
                                      .add({
                                    'nama': _nmC.text,
                                    'deskripsi': _ktC.text,
                                    'harga': int.parse(_hrF.text),
                                    'kategori': _kt.text.toLowerCase(),
                                    'foto': c.fil,
                                    // 'ikon': _gambarController.toString(),
                                  }).then((value) {
                                    print("sukses Simpan");
                                    Navigator.pop(context);
                                    StatusAlert.show(
                                      context,
                                      duration: Duration(seconds: 2),
                                      title: 'Sukses',
                                      subtitle: 'Sukses Simpan',
                                      backgroundColor: secondColor,
                                      configuration: IconConfiguration(
                                          icon: Icons.done,
                                          color: Colors.white),
                                      maxWidth: 260,
                                    );
                                  });
                                  c.cls();
                                },
                                child: Text("Simpan Menu"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> showModalPesen(BuildContext context, index, makanan) {
    final AdminMenuController c = Get.find();

    // final _gambarController = controller.file_im;
    final _nmC = TextEditingController();
    final _ktC = TextEditingController();
    final _hrF = TextEditingController();
    final _kt = TextEditingController();
    var _hrM = makanan.docs[index]['harga'];
    var _gmB = makanan.docs[index]['foto'];
    var _de = makanan.docs[index]['deskripsi'];
    var _p = FirebaseAuth.instance.currentUser?.email;
    var _d = makanan.docs[index].id;
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 600,
              width: 100,
              padding: const EdgeInsets.all(20),
              // color: Colors.amber,
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Edit Menu",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'monday-feelings-font',
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            // c.ui();
                          },
                          child: GetBuilder<AdminMenuController>(
                            init: AdminMenuController(),
                            initState: (_) {},
                            builder: (_) {
                              return Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.image,
                                      size: 40,
                                    ),
                                    // Text(c.fil == ""
                                    //     ? "masukkan gambar"
                                    //     : "seleted")
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _nmC..text = makanan.docs[index]['nama'],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'makanan detail',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _hrF
                            ..text = makanan.docs[index]['harga'].toString(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Harga detail',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _kt
                            ..text = makanan.docs[index]['kategori'],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'kategori detail',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          // minLines: 4,
                          maxLines: 2,
                          controller: _ktC..text = _de,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'tambah Keterangan',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.orange),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ))),
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('makanan')
                                      .doc(_d)
                                      .delete()
                                      .then((value) {
                                    print("sukses Hapus");
                                    Navigator.pop(context);
                                    StatusAlert.show(
                                      context,
                                      duration: Duration(seconds: 2),
                                      title: 'Sukses',
                                      subtitle: 'Sukses Hapus',
                                      backgroundColor: secondColor,
                                      configuration: IconConfiguration(
                                          icon: Icons.done,
                                          color: Colors.white),
                                      maxWidth: 260,
                                    );
                                  });
                                  c.cls();
                                },
                                child: Text("Hapuss"),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            secondColor),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ))),
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('makanan')
                                      .doc(_d)
                                      .set({
                                    'nama': _nmC.text,
                                    'deskripsi': _ktC.text,
                                    'harga': int.parse(_hrF.text),
                                    'kategori': _kt.text.toLowerCase(),
                                    'foto': _gmB,
                                    // 'ikon': _gambarController.toString(),
                                  }).then((value) {
                                    print("sukses Pesenn");
                                    Navigator.pop(context);
                                    StatusAlert.show(
                                      context,
                                      duration: Duration(seconds: 2),
                                      title: 'Sukses',
                                      subtitle: 'Sukses Edit',
                                      backgroundColor: secondColor,
                                      configuration: IconConfiguration(
                                          icon: Icons.done,
                                          color: Colors.white),
                                      maxWidth: 260,
                                    );
                                  });
                                  c.cls();
                                },
                                child: Text("EDIT"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
