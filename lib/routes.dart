// import 'package:flutter/material.dart';
// import 'package:kampus_gratis/components/bottom_navbar.dart';
// import 'package:kampus_gratis/screens/Login/login_screen.dart';
// import 'package:kampus_gratis/screens/bookmark/dokumen.dart';
// import 'package:kampus_gratis/screens/pemutarVideo/video_screen2.dart';
// import 'package:kampus_gratis/screens/profil/editprofil.dart';
// //import 'package:kampus_gratis/screens/videoplayer/videoplayer.dart';
// import 'screens/beranda/beranda.dart';
// import 'screens/kursus/kursus.dart';
// import 'screens/bookmark/bookmarks.dart';
// import 'screens/konten/konten_screen.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => Bottom_Navbar());
//       case '/login':
//         return MaterialPageRoute(builder: (_) => LoginPage());
//       case '/beranda':
//         return MaterialPageRoute(builder: (_) => Beranda());
//       case '/kursus':
//         return MaterialPageRoute(builder: (_) => Kursus());
//       case '/dokumen':
//         return MaterialPageRoute(builder: (_) => HalamanDokumen());
//       case '/bookmark':
//         return MaterialPageRoute(builder: (_) => Bookmarks());
//       case '/video':
//         return MaterialPageRoute(builder: (_) => VideoPage());
//       case '/edit':
//         return MaterialPageRoute(builder: (_) => Editflutter());

//       default:
//         return _errorRoute();
//     }
//   }

//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(title: Text("Error")),
//         body: Center(
//           child: Text("Error page"),
//         ),
//       );
//     });
//   }
// }
