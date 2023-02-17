import 'package:aplikasi_shelter_bima/app/data/authcontroller..dart';
import 'package:aplikasi_shelter_bima/app/routes/app_pages.dart';
import 'package:aplikasi_shelter_bima/app/utils/appColor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();
  final _pCo = TextEditingController();
  final _uCo = TextEditingController();
  final _a = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: Get.height,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text.rich(
                      TextSpan(
                        text: "Welcome,\n",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 32,
                            fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                            text: "Warung Mamah Bima",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    TextField(
                      controller: _uCo,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
                      controller: _pCo,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                        ),
                        // onPressed: () {
                        //   // Get.toNamed(Routes.DASHBOARD);

                        // },
                        onPressed: () async {
                          final user = await _a.signInWithEmailAndPassword(
                              email: _uCo.text, password: _pCo.text);
                          if (user != null) {
                            // print(email);
                            Get.offAllNamed(Routes.ADMIN);
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          authController.signInWithGoogle();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/google.png"),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Masuk dengan Google",
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Belum punya akun?"),
                          TextButton(
                            onPressed: () {
                              authController.signInWithGoogle();
                            },
                            child: const Text("Daftar dg Email"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
