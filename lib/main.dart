import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/components/loading.dart';
//import 'package:kampus_gratis/model/userModel.dart';
import 'package:kampus_gratis/routes.dart';
import 'package:kampus_gratis/components/bottom_navbar.dart';
import 'package:kampus_gratis/routes/app_page.dart';
import 'package:kampus_gratis/screens/konten/konten_screen.dart';
import 'package:kampus_gratis/screens/liblary/liblary_konten.dart';
//import 'package:kampus_gratis/screens/routes/app_pages.dart';
import 'package:kampus_gratis/services/auth_controller.dart';
import 'package:kampus_gratis/size_config.dart';
//import 'package:kampus_gratis/screens/videoplayer/product_page.dart';
//import 'package:kampus_gratis/screens/videoplayer/videoplayer.dart';
//import 'package:kampus_gratis/screens/videoplayer/product_page.dart';
import 'services/auth_controller.dart';
import 'routes/app_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController(), permanent: true);
    return StreamBuilder<User?>(
      stream: authC.authStatus(),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.active) {
          print("Loaded");
          return GetMaterialApp(
            //onGenerateRoute: RouteGenerator.generateRoute,
            debugShowCheckedModeBanner: false,
            title: 'Kampus Gratis',
            theme: ThemeData(
              fontFamily: 'Montserrat',
              primarySwatch: Colors.blue,
            ),
            //initialRoute: '/',
            initialRoute: snapshot.data != null ? '/' : '/login',
            getPages: AppPages.routes,
          );
        } else {
          return LoadingView();
        }
      },
    );
  }
}
