import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/components/popup_custom.dart';
import 'package:kampus_gratis/constants.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> authStatus() {
    return auth.authStateChanges();
  }

  void login(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user!.emailVerified) {
        Get.offAllNamed('/');
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialogBox(
                title: "Verification Email",
                descriptions: "Email perlu di verifikasi terlebih dahulu",
                text: "Ok",
                img: Image.asset('assets/images/logo.jpg'),
              );
            });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void signup(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.sendEmailVerification();
      Get.defaultDialog(
        title: "Verification Email",
        middleText: "Email verifikasi telah dikirimkan ke $email",
        onConfirm: () {
          Get.back(); //menutup message dialog
          Get.back(); //kembali ke halaman login
        },
        textConfirm: "Ok, Saya akan cek email",
        buttonColor: AppColor.fixmaincolor,
        confirmTextColor: Colors.black,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "The password provided is too weak",
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "The account already exists for that email.",
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed("/login");
  }
}
