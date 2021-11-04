//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kampus_gratis/components/badgeCard.dart';
import 'package:kampus_gratis/constants.dart';
import 'package:kampus_gratis/model/kontenModel.dart';
import 'contentCard.dart';
//import 'pemutarVideo.dart';

class ItemCard extends StatelessWidget {
  final int id;
  final int index;
  final List<KontenModel> konten;
  final VoidCallback press;
  final Color cardcolor;
  final IconData cardicon;

  ItemCard({
    required this.id,
    required this.index, 
    required this.konten, 
    required this.press,
    required this.cardcolor,
    required this.cardicon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: ContentCard(
        title: konten[index].judul,
        description: konten[index].deskripsi,
        onTap: press,
        imageurl: "https://7i.se/logo.png",
        // rightBadge: cardcolor,
        // suffixIcon: cardicon,
        // suffixIconColor: Colors.white,
      ),
      // child: InkWell(
      //   onTap: press,
      //   child: Ink(
      //     color: AppColor.fixmaincolor,
      //     child: Card(
      //       elevation: 5.0,
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(0.0),
      //       ),
      //       child: Container(
      //         width: MediaQuery.of(context).size.width,
      //         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: <Widget>[
      //             Row(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               children: <Widget>[
      //                 Container(
      //                   width: 55.0,
      //                   height: 55.0,
      //                   child: Icon(Icons.video_collection),
      //                 ),
      //                 SizedBox(
      //                   width: 6.0,
      //                 ),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: <Widget>[
      //                     Text(konten[index].judul,
      //                         style: TextStyle(
      //                             color: Colors.black,
      //                             fontSize: 18.0,
      //                             fontWeight: FontWeight.bold)),
      //                     SizedBox(
      //                       height: 5.0,
      //                     ),
      //                   ],
      //                 )
      //               ],
      //             ),
      //             Container(
      //               alignment: Alignment.center,
      //               padding:
      //                   EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      //               child: Icon(Icons.download),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
