import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kampus_gratis/database/db.dart';
import 'package:kampus_gratis/model/dokumenModel.dart';
import 'package:kampus_gratis/screens/bookmark/DokumenModel.dart';
//import 'package:kampus_gratis/screens/konten/components/kontendokumenModel.dart';
import 'package:kampus_gratis/screens/bookmark/dokumen.dart';
// import 'package:kampus_gratis/screens/bookmark/model.dart';
import 'package:kampus_gratis/constants.dart' as color;
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:async';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Dokumen extends StatefulWidget {
  const Dokumen({Key? key}) : super(key: key);

  @override
  _Dokumen createState() => _Dokumen();
}

class _Dokumen extends State<Dokumen> {
  List<DokumenModel> dokumenmodel = [];

// meengambil data di sqflite untuk bookmark
  getData() async {
    dokumenmodel.clear();
    var list = await DB().getAllDokumen();
    list.forEach((element) {
      dokumenmodel.add(element as DokumenModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dokumen Saya'),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        backgroundColor: Colors.blue[100],
        body: Container(
            child:
                // mengecek apakah data ada atau tidak
                dokumenmodel.length > 0
                    ? ListView.builder(
                        //ga bsa d scroll
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: dokumenmodel.length,
                        scrollDirection: Axis.vertical,
                        // shrinkWrap: true,
                        padding: EdgeInsets.all(8.0),
                        itemBuilder: (context, index) {
                          // Course course = Assets.courses[index];
                          DokumenModel dokumen = dokumenmodel[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return HalamanItemPage(
                                      dokumen: dokumen,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              height: 100,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.brown[200],
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5.0),
                                          width: 70,
                                          height: 70,
                                          child: Icon(
                                            Icons.document_scanner,
                                            size: 35,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(dokumenmodel[index].judul,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 10.0),
                                      child: Icon(Icons.download),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    :
                    //memunculkan text jika data kosong
                    Center(
                        child: Text('kosong'),
                      )));
  }
}
