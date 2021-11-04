import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kampus_gratis/model/userModel.dart';

class Data extends ChangeNotifier {
  
  String? username;
  User? user;
  int videoID =0;
  List courseVideoList = [];                              //List of course video data one for each course
  List generalList = [];

  //Update the video of a course video 
  //when user clicks on a new video
  void updateCurrentVideoID(int value){
    videoID = value;
    notifyListeners();
  }

  //gets the "coursevideo" field for each course
  // and assigns it to variable courseVideoList
  void getCourseVideoList(List list){
    courseVideoList = list;
    notifyListeners();
  }
}
