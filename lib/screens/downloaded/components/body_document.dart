import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';

class BodyDocument extends StatefulWidget {
  const BodyDocument({Key? key}) : super(key: key);

  @override
  _Dokumen createState() => _Dokumen();
}

class _Dokumen extends State<BodyDocument> {

  //================================Directory======================================
  final Directory _documentDir = Directory('/storage/emulated/0/KGDocuments');
  //===============================================================================

  //=================================Open File=====================================
  void openFile(String filepath) async {
    await OpenFile.open(filepath);
  }
  //===============================================================================

  //=================================Delete File===================================
  Future<void> deleteFile(File file) async {
    try {
      if (file.existsSync()) {
        file.deleteSync(recursive: true);
      }
    } catch (e) {
      print('gagal');
      // Error in getting access to the file.
    }
  }
  //===============================================================================

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Builder(
        builder: (context) {

          if (!Directory(_documentDir.path).existsSync()) {

            return const Center(
              child: Text(
                'Direktori Tidak Ditemukan!',
                style: TextStyle(fontSize: 18.0),
              ),
            );
          } else {
            final documentList = _documentDir
            .listSync()
            .map((item) => item.path)
            .where((item) => item.endsWith('.pdf'))
            .toList(growable: false);
            
            if (documentList.isNotEmpty) {

              // Versi original
              // return Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              //   child: ListView.builder(
              //     itemCount: documentList.length,
              //     itemBuilder: (context, index) {
              //       print(documentList[index].toString());
              //       return InkWell(
              //         child: Card(
              //           child:ListTile(
              //             title: Text(documentList[index].split('/').last),
              //             leading: const Icon(Icons.image),
              //             trailing: const Icon(Icons.delete, color: Colors.redAccent,),
              //           )
              //         ),
              //         onTap: () => openFile(documentList[index].toString()),
              //       );
              //     },
              //   ),
              // );

              // Versi 2
              return Column(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.only(top: 8.0),
                        // color: Colors.blue,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: documentList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => openFile(documentList[index].toString()),
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(20.0, 8.0, 13.0, 0.0),
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            height: 33,
                                            width: 33,
                                            decoration: const BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.description_rounded,
                                              size: 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(width: 5.0),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  documentList[index].split('/').last,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w400),
                                                ),
                                                // Row(
                                                //   children: <Widget>[
                                                //     Text(
                                                //       dokumen.deskripsi,
                                                //       style: const TextStyle(
                                                //           fontWeight: FontWeight.w200),
                                                //     ),
                                                //     SizedBox(width: 5.0),
                                                //     // Text(
                                                //     //   "·",
                                                //     //   style: TextStyle(
                                                //     //       fontWeight: FontWeight.bold),
                                                //     // ),
                                                //     // SizedBox(width: 5.0),
                                                //     // Text(
                                                //     //   dokumen.course,
                                                //     //   style: TextStyle(
                                                //     //       fontWeight: FontWeight.w200),
                                                //     // )
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 5.0),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                deleteFile(File(documentList[index]));
                                              });
                                            },
                                            child: const Icon(
                                              Icons.delete,
                                              color: Colors.redAccent,
                                              size: 20.0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 7.0),
                                      child: SizedBox(
                                        height: 1.0,
                                        child: Container(
                                          color: Colors.black26,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );

            } else {
              return const Center(
                  child: Text(
                    'Maaf, Tidak Ada Dokumen yang Ditemukan!',
                    style: TextStyle(fontSize: 18.0),
                  ),
              );
            }

          }
          
        },
      ),
    );
  }
}
