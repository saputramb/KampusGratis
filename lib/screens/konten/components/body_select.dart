//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kampus_gratis/screens/konten/components/body_dokumen.dart';
import 'package:kampus_gratis/screens/konten/components/body_video.dart';

class BodySelect extends StatelessWidget {
  //membuat properti variable
  final int id;
//membuat konstruktur id
  const BodySelect({Key? key, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          color: Colors.white,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                TabBar(
                  labelColor: Colors.black,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  unselectedLabelColor: Colors.grey[400],
                  unselectedLabelStyle:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.transparent,
                  tabs: <Widget>[
                    Tab(
                      child: Text("Video"),
                    ),
                    Tab(
                      child: Text("Dokumen"),
                    ),
                  ],
                ),
                Container(
                  height: height * 0.6,
                  child: TabBarView(
                    children: <Widget>[
                      BodyVideo(
                        id: id,
                      ),
                      BodyDokumen(
                        id: id,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
