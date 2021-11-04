//import 'dart:ui';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kampus_gratis/model/courseModel.dart';
//import 'package:kampus_gratis/screens/kursus/component/modul.dart';
import 'package:kampus_gratis/constants.dart';
import 'package:kampus_gratis/screens/konten/konten_screen.dart';

class Halamanintro extends StatefulWidget {
  final CourseModel course;

  Halamanintro({required this.course});
  @override
  State<Halamanintro> createState() => _HalamanintroState();
}

class _HalamanintroState extends State<Halamanintro> {
  void toKontenPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return KontenPage(course: widget.course);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
        width: 150,
        height: 90,
        padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: Center(
          child: SizedBox(
            width: 280,
            height: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => AppColor.fixmaincolor,
                ),
              ),
              onPressed: () {
                toKontenPage();
              },
              child: Text('Mulai Belajar'),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leadingWidth: 0,
        leading: SizedBox(),
        backgroundColor: AppColor.fixsecondarycolor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                ),
              ],
            ),
            Center(
              child: Image.asset(
                'assets/images/k1.png',
                width: 75,
                height: 75,
              ),
            ),
            SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                '${widget.course.nama}',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Text(
                    '50 Materi',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.montserrat(
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.circle,
                    size: 4,
                  ),
                  SizedBox(width: 8),
                  Text(
                    '10 Jam',
                    style: GoogleFonts.montserrat(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        toolbarHeight: 200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.course.deskripsi}',
                textAlign: TextAlign.justify,
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/sally-1.jpg',
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.width * 0.7,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
