import 'package:get/get.dart';
import 'package:kampus_gratis/components/bottom_navbar.dart';
import 'package:kampus_gratis/screens/Login/login_screen.dart';
import 'package:kampus_gratis/screens/Register/register_screen.dart';
import 'package:kampus_gratis/screens/bookmark/bookmarks.dart';
import 'package:kampus_gratis/screens/bookmark/dokumen.dart';
import 'package:kampus_gratis/screens/kursus/kursus.dart';
import 'package:kampus_gratis/screens/pemutarVideo/video_screen2.dart';
import 'package:kampus_gratis/screens/profil/editprofil.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: '/',
      page: () => Bottom_Navbar(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
    ),
    GetPage(
      name: '/register',
      page: () => RegisterPage(),
    ),
    GetPage(
      name: '/kursus',
      page: () => Kursus(),
    ),
    // GetPage(
    //   name: '/dokumen',
    //   page: () => HalamanItemPage(),
    // ),
    GetPage(
      name: '/bookmark',
      page: () => Bookmarks(),
    ),
    // GetPage(
    //   name: '/video',
    //   page: () => VideoPage(),
    // ),
    GetPage(
      name: '/edit',
      page: () => Editflutter(),
    ),
  ];
}
