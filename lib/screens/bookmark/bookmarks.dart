import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:kampus_gratis/main.dart';
import 'package:kampus_gratis/screens/bookmark/bdokumen.dart';
//import 'package:kampus_gratis/screens/bookmark/bvideo.dart';
import 'package:kampus_gratis/screens/bookmark/bvideo.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  _BookmarksState createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  @override
  Widget build(BuildContext context) {
    return MyHomeBookmark(title: 'Item Saya');
  }
}

class MyHomeBookmark extends StatefulWidget {
  const MyHomeBookmark({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomeBookmark> createState() => _MyHomeBookmarkState();
}

class _MyHomeBookmarkState extends State<MyHomeBookmark> {
  get child => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => (0),
        ),
      ),
      backgroundColor: Colors.blue[100],
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          children: <Widget>[
            buildDokumenCard(
                Icons.document_scanner, "Dokumen", Icons.arrow_forward_ios),
            buildVideoCard(
                Icons.video_collection, "Video", Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  Widget buildDokumenCard(
          IconData iconData, String text, IconData iconButton) =>
      Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Get.to(Dokumen());
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.brown[200],
                          borderRadius: BorderRadius.circular(5)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      width: 70,
                      height: 70,
                      child: Icon(
                        iconData,
                        size: 35,
                      ),
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          text,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ]),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Get.to(Dokumen());
                        },
                        icon: Icon(iconButton)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildVideoCard(IconData iconData, String text, IconData iconButton) =>
      Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Get.to(Video());
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.brown[200],
                          borderRadius: BorderRadius.circular(5)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      width: 70,
                      height: 70,
                      child: Icon(
                        iconData,
                        size: 35,
                      ),
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          text,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ]),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Get.to(Video());
                        },
                        icon: Icon(iconButton)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// //import 'package:kampus_gratis/main.dart';
// import 'package:kampus_gratis/screens/bookmark/bdokumen.dart';
// import 'package:kampus_gratis/screens/bookmark/DokumenModel.dart';
// //import 'package:kampus_gratis/screens/bookmark/bvideo.dart';
// import 'package:kampus_gratis/screens/bookmark/bvideo.dart';

// class Bookmarks extends StatefulWidget {
//   const Bookmarks({Key? key}) : super(key: key);

//   @override
//   _BookmarksState createState() => _BookmarksState();
// }

// class _BookmarksState extends State<Bookmarks> {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Item Saya',
//       home: const MyHomeBookmark(title: 'Item Saya'),
//     );
//   }
// }

// class MyHomeBookmark extends StatefulWidget {
//   const MyHomeBookmark({Key? key, required this.title}) : super(key: key);
//   final String title;
//   @override
//   State<MyHomeBookmark> createState() => _MyHomeBookmarkState();
// }

// class _MyHomeBookmarkState extends State<MyHomeBookmark> {
//   get child => null;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         automaticallyImplyLeading: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           onPressed: () => (0),
//         ),
//       ),
//       backgroundColor: Colors.blue[100],
//       body: Container(
//         child: ListView(
//           padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//           children: <Widget>[
//             buildDokumenCard(
//                 Icons.document_scanner, "Dokumen", Icons.arrow_forward_ios),
//             buildVideoCard(
//                 Icons.video_collection, "Video", Icons.arrow_forward_ios),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildDokumenCard(
//           IconData iconData, String text, IconData iconButton) =>
//       Card(
//         child: InkWell(
//           splashColor: Colors.blue.withAlpha(30),
//           onTap: () {
//             Get.to(BodyDokumen());
//           },
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Colors.brown[200],
//                           borderRadius: BorderRadius.circular(5)),
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//                       width: 70,
//                       height: 70,
//                       child: Icon(
//                         iconData,
//                         size: 35,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 6.0,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           text,
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ],
//                     ),
//                   ]),
//               Container(
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     IconButton(
//                         onPressed: () {
//                           Get.to(Dokumen());
//                         },
//                         icon: Icon(iconButton)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );

//   Widget buildVideoCard(IconData iconData, String text, IconData iconButton) =>
//       Card(
//         child: InkWell(
//           splashColor: Colors.blue.withAlpha(30),
//           onTap: () {
//             Get.to(Video());
//           },
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Colors.brown[200],
//                           borderRadius: BorderRadius.circular(5)),
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//                       width: 70,
//                       height: 70,
//                       child: Icon(
//                         iconData,
//                         size: 35,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 6.0,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           text,
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ],
//                     ),
//                   ]),
//               Container(
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     IconButton(
//                         onPressed: () {
//                           Get.to(Video());
//                         },
//                         icon: Icon(iconButton)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
// }
