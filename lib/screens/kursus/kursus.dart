import 'package:flutter/material.dart';
import 'package:kampus_gratis/screens/kursus/Page/pemilihanCourse.dart';

class Kursus extends StatefulWidget {
  const Kursus({Key? key}) : super(key: key);

  @override
  _KursusState createState() => _KursusState();
}

class _KursusState extends State<Kursus> {
  @override
  Widget build(BuildContext context) {
    return pemilihanCourse();
  }
}
