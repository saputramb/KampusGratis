//import 'package:flutter/cupertino.dart';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:kampus_gratis/database/db.dart';
import 'package:kampus_gratis/model/dokumenModel.dart';
//import 'package:kampus_gratis/main.dart';
import 'package:kampus_gratis/screens/bookmark/bdokumen.dart';
//import 'package:kampus_gratis/screens/konten/components/kontendokumenModel.dart';
// import 'package:kampus_gratis/screens/bookmark/model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// class HalamanDokumen extends StatefulWidget {
//   final DokumenModel dokumen;

//   const HalamanDokumen({Key? key, required this.dokumen}) : super(key: key);

//   @override
//   State<HalamanDokumen> createState() => _HalamanDokumenState();
// }

// class _HalamanDokumenState extends State<HalamanDokumen> {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Kampus Gratis',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HalamanItemPage(dokumen: DokumenModel,),
//     );
//   }
// }

class HalamanItemPage extends StatefulWidget {
  final DokumenModel dokumen;
  HalamanItemPage({Key? key, required this.dokumen}) : super(key: key);
  @override
  State<HalamanItemPage> createState() => _HalamanItemState();
}

class _HalamanItemState extends State<HalamanItemPage> {
  bool isBookmarked = false;

  addDokumen(DokumenModel dokumen) async {
    DB().insertDokumen(dokumen as DokumenModel).then((value) => print(value));
  }

  deleteDokumen(int id) async {
    DB().deleteWhereIdDokumen(id).then((value) => print(value));
  }

  cekDokumen() async {
    //ngambil parameter id
    bool isExist = await DB().cekdokumen(widget.dokumen.id);
    isBookmarked = isExist;
    setState(() {});
  }

  @override
  void initState() {
    cekDokumen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: Colors.purple[300],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              toDokumen();
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          // title: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         IconButton(
          //           onPressed: () {
          //             toDokumen();
          //           },
          //           icon: Icon(Icons.arrow_back_ios_new),
          //         ),
          //         IconButton(
          //           onPressed: () {},
          //           icon: Icon(Icons.more_vert),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.purple[200],
                        borderRadius: BorderRadius.circular(20)),
                    height: 70,
                    width: 70,
                    child: Icon(
                      Icons.document_scanner,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Membuat Design Web',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          Text(
                            '4 halaman',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.circle,
                            size: 4,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '10 Mb',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {
                                isBookmarked = !isBookmarked;
                              });
                              if (isBookmarked) {
                                addDokumen(widget.dokumen);
                              } else {
                                deleteDokumen(widget.dokumen.id);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Container(
            child: SfPdfViewer.network(
                'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf')));
    // ListView(
    //   padding: EdgeInsets.all(16),
    //   children: [
    //     Text(
    //       description,
    //       textAlign: TextAlign.justify,
    //     ),
    //     SizedBox(
    //       height: 5,
    //     ),
    //     Text(
    //       description1,
    //       textAlign: TextAlign.justify,
    //     ),
    //     SizedBox(
    //       height: 5,
    //     ),
    //     Text(
    //       description2,
    //       textAlign: TextAlign.justify,
    //     ),
    //     SizedBox(
    //       height: 5,
    //     ),
    //     Text(
    //       description3,
    //       textAlign: TextAlign.justify,
    //     ),
    //     SizedBox(
    //       height: 5,
    //     ),
    //     Text(
    //       description4,
    //       textAlign: TextAlign.justify,
    //     ),
    //     SizedBox(
    //       height: 5,
    //     ),
    //   ],
    // ),
  }

  void toDokumen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Dokumen();
        },
      ),
    );
  }
}
