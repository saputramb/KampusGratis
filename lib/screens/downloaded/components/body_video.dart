import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class BodyVideo extends StatefulWidget {
  const BodyVideo({Key? key}) : super(key: key);

  @override
  State<BodyVideo> createState() => _BodyVideoState();
}

class _BodyVideoState extends State<BodyVideo> {

  //================================Directory======================================
  final Directory _videoDir = Directory('/storage/emulated/0/KGVideos');
  // final Directory _videoDir = Directory('/storage/emulated/0/KGDocuments');
  // final Directory _videoDir = Directory('/storage/emulated/0/Vido');
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

          if (!Directory(_videoDir.path).existsSync()) {

            return const Center(
              child: Text(
                'Direktori Tidak Ditemukan!',
                style: TextStyle(fontSize: 18.0),
              ),
            );
          } else {
            final videoList = _videoDir
            .listSync()
            .map((item) => item.path)
            .where((item) => item.endsWith('.mp4'))
            .toList(growable: false);
            
            if (videoList.isNotEmpty) {

              // Versi original
              // return Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              //   child: ListView.builder(
              //     itemCount: videoList.length,
              //     itemBuilder: (context, index) {
              //       print(videoList[index].toString());
              //       return InkWell(
              //         child: Card(
              //           child:ListTile(
              //             title: Text(videoList[index].split('/').last),
              //             leading: const Icon(Icons.image),
              //             trailing: const Icon(Icons.delete, color: Colors.redAccent,),
              //           )
              //         ),
              //         onTap: () => openFile(videoList[index].toString()),
              //       );
              //     },
              //   ),
              // );

              // Versi 2
              return Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: videoList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => openFile(videoList[index].toString()),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 13.0, 0.0),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Stack(
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 80,
                                                  width: 140,
                                                  child: Image.asset(
                                                    // content.imageUrl,
                                                    'assets/images/image1.jpg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 8.0,
                                                  right: 8.0,
                                                  child: Container(
                                                    padding: const EdgeInsets.all(2.0),
                                                    color: Colors.black87,
                                                    // child: const Text(
                                                    //   // content.duration,
                                                    //   "5:35",
                                                    //   style:
                                                    //       TextStyle(color: Colors.white),
                                                    // ),
                                                  ),
                                                ),
                                                Positioned(
                                                    bottom: 0,
                                                    right: 0,
                                                    top: 0,
                                                    left: 0,
                                                    child: Image.asset(
                                                      'assets/icons/Play_circle2.png',
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 5.0),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                videoList[index].split('/').last,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              const SizedBox(height: 3.0),
                                              // const Text(
                                              //   // content.course,
                                              //   'Kredit',
                                              //   style: TextStyle(
                                              //     fontWeight: FontWeight.w300,
                                              //   ),
                                              // ),
                                              // const Text(
                                              //   // content.size,
                                              //   '5 Mb',
                                              //   style: TextStyle(
                                              //     fontWeight: FontWeight.w300,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 5.0),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              deleteFile(File(videoList[index]));
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
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );

            } else {
              return const Center(
                  child: Text(
                    'Maaf, Tidak Ada Video yang Ditemukan!',
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
