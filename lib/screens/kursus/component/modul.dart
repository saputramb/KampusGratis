import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:kampus_gratis/screens/kursus/component/repository.dart';
import 'package:kampus_gratis/constants.dart' as color;
import 'package:kampus_gratis/screens/kursus/Page/halamanintro.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:kampus_gratis/model/courseModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kampus_gratis/services/data_Repository.dart';

class Modul extends StatefulWidget {
  const Modul({Key? key}) : super(key: key);

  @override
  _Modul createState() => _Modul();
}

class _Modul extends State<Modul> {
  List<CourseModel> coursemodel = [];
  DataApiRepository repository = DataApiRepository();

// variable search null safety tipe string
  getData({String? search}) async {
    //kalau pencariannya kosong pake if
    if (search == null) {
      coursemodel = await repository.getListKursus();
    } else {
      //kalo ada pencarian
      List<CourseModel> data = await repository.getListKursus();
      //update data course model dengan filter
      print(coursemodel[0].deskripsi);
      coursemodel = data
          .where((element) =>
              element.nama.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
    //tolowercase ngubah data jadi huruf kecil data nama
    //contains mengandung kata yang bersangkutan
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<Null> _refresh() {
    return getData().then((_coursemodel) {
      setState(() => coursemodel = _coursemodel);
    });
  }

  @override
  Widget build(BuildContext context) {
    //listview.builder bungkus pake colomn
    return Column(
      children: [
        search(),
        //dibungkus sama sizebox biar aman sebagai tempat if else agar tidak eror
        SizedBox(
          child: coursemodel.length > 0
              ? ListView.builder(
                  //ga bsa d scroll
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: coursemodel.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                  itemBuilder: (context, index) {
                    // Course course = Assets.courses[index];
                    CourseModel course = coursemodel[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Halamanintro(course: course);
                            },
                          ),
                        );
                      },
                      child: Expanded(
                        child: Container(
                          padding: EdgeInsets.all(11),
                          height: 126,
                          margin: EdgeInsets.fromLTRB(
                            0,
                            index == 0 ? 0 : 8,
                            0,
                            index == 1 ? 0 : 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: color.AppColor.fixsecondarycolor),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 4,
                                  offset: Offset(2.0, 3.0))
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.asset(
                                    'assets/images/pic1.png',
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        coursemodel[index].nama,
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        coursemodel[index].deskripsi,
                                        maxLines: 2,
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      RatingBar.builder(
                                          initialRating: 4,
                                          minRating: 3,
                                          itemSize: 12,
                                          itemBuilder: (context, _) =>
                                              ImageIcon(
                                                AssetImage(
                                                    'assets/icons/star.png'),
                                                color: Colors.amber,
                                              ),
                                          onRatingUpdate: (rating) {}),
                                      SizedBox(height: 8),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            child: ImageIcon(
                                              AssetImage(
                                                  'assets/icons/folder.png'),
                                              size: 12,
                                            ),
                                          ),
                                          SizedBox(width: 1),
                                          Text(
                                            '48 Materi',
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              // fontWeight: FontWeight.normal,
                                              fontSize: 8,
                                            ),
                                          ),
                                          SizedBox(width: 2),
                                          GestureDetector(
                                            child: ImageIcon(
                                              AssetImage(
                                                  'assets/icons/Play_circle.png'),
                                              size: 11,
                                            ),
                                          ),
                                          SizedBox(width: 1),
                                          Text(
                                            '70 video',
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              // fontWeight: FontWeight.normal,
                                              fontSize: 8,
                                            ),
                                          ),
                                          SizedBox(width: 2),
                                          GestureDetector(
                                            child: ImageIcon(
                                              AssetImage(
                                                  'assets/icons/clock_circle.png'),
                                              size: 11,
                                            ),
                                          ),
                                          SizedBox(width: 1),
                                          Text(
                                            '20h 5m 2s',
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              // fontWeight: FontWeight.normal,
                                              fontSize: 8,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 16),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Column(
                  children: [
                    Image.asset(
                      'assets/images/Saly-17.png',
                      width: double.maxFinite,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('Penelusuran tidak ditemukan'),
                  ],
                ),
        ),
      ],
    );
  }

  Widget search() {
    return Container(
      width: 280,
      height: 35,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                getData(search: value);
              },
              decoration: InputDecoration(
                  hintText: 'Search Modul Bank',
                  hintStyle: GoogleFonts.montserrat(
                      fontSize: 12, fontWeight: FontWeight.w500),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(20, 8, 20, 4)),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
          Container(
            margin: EdgeInsets.all(0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: color.AppColor.fixsecondarycolor,
            ),
          ),
        ],
      ),
    );
  }
}
