import 'package:aplikasi_shelter_bima/app/utils/appColor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:status_alert/status_alert.dart';

class Minuman extends StatefulWidget {
  const Minuman({super.key});

  @override
  State<Minuman> createState() => _MinumanState();
}

class _MinumanState extends State<Minuman> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('makanan')
            .where('kategori', isEqualTo: 'minuman')
            .snapshots(),
        builder:
            (__, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Text(
              "eor",
              style: TextStyle(
                  fontSize: 100, color: Color.fromARGB(255, 226, 7, 7)),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
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
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 3,
                            color: Colors.grey,
                            offset: Offset(0, 3))
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 80,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    makanan.docs[index]['foto'].toString()),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Container(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${makanan.docs[index]['nama']}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700)),
                                Text(
                                  '${makanan.docs[index]['deskripsi']}',
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  'Rp. ${makanan.docs[index]['harga']},',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showModalPesen(context, index, makanan);
                              print("pesan ${makanan.docs[index]['nama']}");
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              padding: const EdgeInsets.all(15),
                              child: const Center(
                                child: Text("Pesan"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }
}

Future<void> showModalPesen(BuildContext context, index, makanan) {
  // final _gambarController = controller.file_im;
  final _nmC = TextEditingController();
  final _ktC = TextEditingController();
  var _hrM = makanan.docs[index]['harga'];
  var _gmB = makanan.docs[index]['foto'];
  var _p = FirebaseAuth.instance.currentUser?.email;
  return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 400,
            padding: const EdgeInsets.all(20),
            // color: Colors.amber,
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pesan makana",
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
                        // minLines: 4,
                        maxLines: 3,
                        controller: _ktC,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'tambah Keterangan',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 69, 221, 255)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ))),
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('pesanan_makanan')
                                  .add({
                                'nama': _nmC.text,
                                'keterangan': _ktC.text,
                                'hr': _hrM,
                                'gmb': _gmB,
                                'p': _p,
                                // 'ikon': _gambarController.toString(),
                              }).then((value) {
                                print("sukses Pesenn");
                                Navigator.pop(context);
                                StatusAlert.show(
                                  context,
                                  duration: Duration(seconds: 2),
                                  title: 'Sukses',
                                  subtitle: 'Sukses pesan',
                                  backgroundColor: secondColor,
                                  configuration: IconConfiguration(
                                      icon: Icons.done, color: Colors.white),
                                  maxWidth: 260,
                                );
                              });
                            },
                            child: Text("Pesan"),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                        ],
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
