import 'package:aplikasi_shelter_bima/app/utils/appColor.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColor,
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.fastfood,
                                size: 25,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Makanan")
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColor,
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.local_drink,
                                size: 25,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Minuman")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.grey,
                                  offset: Offset(0, 3))
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/mie.jpg"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Mie Get"),
                                    Text(
                                      "Mie yang digandrungi semua orang",
                                      style: TextStyle(fontSize: 10),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
