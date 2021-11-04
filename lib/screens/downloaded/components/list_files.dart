import 'package:flutter/material.dart';
import 'package:kampus_gratis/screens/downloaded/components/body_document.dart';
import 'package:kampus_gratis/screens/downloaded/components/body_video.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ListFiles extends StatefulWidget {
  const ListFiles({Key? key}) : super(key: key);

  @override
  _ListFilesState createState() => _ListFilesState();
}

class _ListFilesState extends State<ListFiles> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            iconSize: 24.0,
            color: Colors.white,
            onPressed: () {},
          ),
          title: const Text(
            "Downloads",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          bottom: TabBar(
            tabs: const <Widget>[
              Tab(
                child: Text(
                  "Video",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Tab(
                child: Text(
                  "Dokumen",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
            indicator: DotIndicator(
              color: Colors.white,
              distanceFromCenter: 16,
              radius: 3,
              paintingStyle: PaintingStyle.fill,
            ),
          ),
        ),

        body: const TabBarView(
          children: <Widget>[
            BodyVideo(),
            BodyDocument(),
          ],
        ),
      ),
    );
  }
}