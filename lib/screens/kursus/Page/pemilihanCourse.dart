import 'package:flutter/material.dart';
import 'package:kampus_gratis/constants.dart';
import 'package:kampus_gratis/screens/kursus/component/modul.dart';
//import 'package:kampus_gratis/screens/kursus/component/search.dart';
import 'package:kampus_gratis/screens/kursus/component/header.dart';
import 'package:kampus_gratis/screens/kursus/component/buttonback.dart';

class pemilihanCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        background(),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [buttonback(context), header(), Modul()],
            ),
          ),
        )
      ],
    ));
  }

  Widget background() {
    return Container(
      height: 200,
      decoration: BoxDecoration(color: AppColor.fixsecondarycolor),
    );
  }
}
