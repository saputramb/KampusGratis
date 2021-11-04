//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/components/badgeCard.dart';
import 'package:kampus_gratis/constants.dart';
import 'package:kampus_gratis/model/kontenModel.dart';
import 'package:kampus_gratis/components/contentCard.dart';
import 'package:kampus_gratis/model/videoModel.dart';
import 'package:kampus_gratis/screens/pemutarVideo/video_screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'pemutarVideo.dart';

class ItemCard extends StatelessWidget {
  final int id;
  final int index;
  final List<VideoModel> konten;
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

  selectedVideo(
      VideoModel selectedModel, List<VideoModel> listvideoModel) async {
    Get.to(VideoPage(
      selectedModel: selectedModel,
      videos: listvideoModel,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: ContentCard(
        title: konten[index].judul,
        description: konten[index].deskripsi,
        onTap: () => selectedVideo(konten[index], konten),
        imageurl: "https://img.youtube.com/vi/${konten[index].link}/0.jpg",
        // rightBadge: cardcolor,
        // suffixIcon: cardicon,
        // suffixIconColor: Colors.white,
      ),
    );
  }
}
