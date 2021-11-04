import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kampus_gratis/constants.dart';
import 'package:kampus_gratis/screens/konten/components/header.dart';
import 'package:kampus_gratis/model/courseModel.dart';

class Header {
  AppBar header(String nama, BuildContext context) => AppBar(
        toolbarHeight: 200,
        leadingWidth: 0,
        leading: SizedBox(),
        backgroundColor: AppColor.fixsecondarycolor,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              child: new Center(
            child: new Column(
              children: <Widget>[
                Icon(
                  Icons.video_collection,
                  color: Colors.white,
                  size: 70,
                )
              ],
            ),
          )
              //child: Image.asset('img/video.png'),
              ),
          SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              '$nama',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: const [
                Text(
                  '10 Video',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Monstserra',
                    color: Colors.white70,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.circle,
                  size: 4,
                ),
                Text(
                  '10 Jam',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Monstserra',
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          
        ]),
        /*  shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            //bottom: Radius.circular(30),
            ),
            
      ),  */
        flexibleSpace: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                //margin: EdgeInsets.all(kDefaultPaddin),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      );
}
