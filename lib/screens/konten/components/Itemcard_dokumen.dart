//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kampus_gratis/components/badgeCard.dart';
import 'package:kampus_gratis/constants.dart';
import 'package:kampus_gratis/model/dokumenModel.dart';
import 'package:kampus_gratis/model/kontenModel.dart';
import 'package:kampus_gratis/components/contentCard.dart';
import 'package:kampus_gratis/model/videoModel.dart';
//import 'pemutarVideo.dart';

class ItemCard extends StatelessWidget {
  final int id;
  final int index;
  final List<DokumenModel> konten;
  final VoidCallback press;
  final Color cardcolor;
  final IconData cardicon;

  ItemCard(
      {required this.id,
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
    );
  }
}
