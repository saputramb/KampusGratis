import 'package:flutter/material.dart';
import 'package:kampus_gratis/size_config.dart';

class VideoDetails extends StatelessWidget {
  const VideoDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(children: [
      Row(
        children: <Widget>[
          Column(children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "test",
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
              width: screenWidth - 80,
              margin: EdgeInsets.only(left: 15.0, bottom: 5.0),
            ),
            Container(
              child: new Text(
                ' Minutes', // Video views count
                style: TextStyle(fontSize: 11.0, color: Colors.grey[700]),
              ),
              width: screenWidth - 80.0,
              margin: EdgeInsets.only(left: 15.0),
            ),
          ]),
          // Container(
          //   child: new IconButton(
          //     icon: new Icon(
          //       Icons.arrow_drop_down,
          //       color: Colors.grey[700],
          //     ),
          //     onPressed: () {},
          //   ),
          //   width: 50.0,
          //   height: 30.0,
          //   margin: EdgeInsets.only(right: 15.0, bottom: 5.0),
          // ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //FIRST COLUMN
          // Column(children: <Widget>[
          //   Container(
          //     child: new IconButton(
          //       icon: new Icon(Icons.thumb_up, color: Colors.grey[600]), // Like
          //       onPressed: () {},
          //     ),
          //     margin: EdgeInsets.only(left: 0.0),
          //   ),
          //   Container(
          //     child: new Text("0"),
          //     margin: EdgeInsets.only(left: 0.0),
          //   ),
          // ]),
          // //SECOND COLUMN
          // Column(children: <Widget>[
          //   Container(
          //     child: new IconButton(
          //       icon: new Icon(Icons.thumb_down,
          //           color: Colors.grey[600]), // Dislike
          //       onPressed: () {},
          //     ),
          //   ),
          //   Container(
          //     child: new Text("0"),
          //   ),
          // ]),
          //THIRD COLUMN
          Column(children: <Widget>[
            Container(
              child: new IconButton(
                icon: new Icon(Icons.share, color: Colors.grey[600]), // Share
                onPressed: () {},
              ),
            ),
            Container(
              child: new Text('Share'),
            ),
          ]),
          //FOURTH COLUMN
          Column(children: <Widget>[
            Container(
              child: new IconButton(
                icon: new Icon(Icons.file_download,
                    color: Colors.grey[600]), // Download
                onPressed: () {},
              ),
            ),
            Container(
              child: new Text('Download'),
            ),
          ]),
          //FIFTH COLUMN
          Column(children: <Widget>[
            Container(
              child: new IconButton(
                icon: new Icon(Icons.add, color: Colors.grey[600]), // Save
                onPressed: () {},
              ),
              margin: EdgeInsets.only(right: 5.0),
            ),
            Container(
              child: new Text('Save'),
              margin: EdgeInsets.only(right: 5.0),
            ),
          ]),
        ],
      ),

      new VideoSeparator(),

      // new VideoSeparatorSecond(),

      // // Comments section; comments number, icon
      // new CommentsSection(
      //     clickedVideoCommentsNumber: clickedVideoCommentsNumber),
      // new AddComment(),

      //LINE BETWEEN
      new Container(
        height: 1.5,
        width: screenWidth,
        margin: const EdgeInsets.only(top: 10.0),
        color: Colors.grey[200],
      ),
    ]);
  }
}

class VideoSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 1.5,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
      color: Colors.grey[200],
    );
  }
}
