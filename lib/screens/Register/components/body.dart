import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/components/background.dart';
import 'package:kampus_gratis/components/header_login.dart';
import 'package:kampus_gratis/components/icon_btn.dart';
import 'package:kampus_gratis/components/primary_button.dart';
import 'package:kampus_gratis/components/text_field.dart';
import 'package:kampus_gratis/constants.dart';
import 'package:kampus_gratis/services/auth_controller.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  //add controller
  final TextEditingController _userController =
      TextEditingController(text: "learning.kampusgratis1@gmail.com");
  final TextEditingController _passwordController =
      TextEditingController(text: "KampusGratis1");

  final _formKey = GlobalKey<FormState>();

  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: HeaderLogin(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Daftar Akun',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColor.fixsecondarycolor,
                    ),
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: LoginTextField(
                        focus: false,
                        correct: true,
                        obscure: false,
                        text: 'Nama Pengguna',
                        icon: Icons.person,
                        controller: _userController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama Pengguna tidak boleh kosong';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      // ignore: prefer_const_constructors
                      child: LoginTextField(
                        focus: false,
                        correct: false,
                        obscure: true,
                        text: 'Kata Sandi',
                        icon: Icons.lock,
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kata Sandi tidak boleh kosong';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    PrimaryButton(
                      text: 'Daftar',
                      press: () {
                        authC.signup(
                            _userController.text, _passwordController.text);
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      color: AppColor.fixmaincolor,
                      textColor: Colors.black,
                      width: size.width,
                      shadowColor: Colors.black,
                      borderColor: AppColor.fixmaincolor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Sudah punya akun?, ',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                              text: 'masuk',
                              style: TextStyle(
                                color: AppColor.fixmaincolor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/login');
                                })
                        ],
                      )),
                    ),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: Text(
                    //     'Lupa kata sandi?',
                    //     style: TextStyle(color: Colors.black),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
