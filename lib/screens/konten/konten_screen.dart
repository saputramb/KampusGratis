import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kampus_gratis/screens/konten/components/body_select.dart';
import 'package:kampus_gratis/screens/konten/components/header.dart';
import 'package:kampus_gratis/model/courseModel.dart';
import 'components/body_select.dart';

class KontenPage extends StatefulWidget {
  final CourseModel course;

  KontenPage({required this.course});

  @override
  State<KontenPage> createState() => _KontenPageState();
}

class _KontenPageState extends State<KontenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: BuildAppBar(
      //   course: course,
      // ),
      appBar: Header().header(widget.course.nama, context),
      body: BodySelect(
        id: widget.course.id,
      ),
    );
  }
}
