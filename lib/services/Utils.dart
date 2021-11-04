// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class Utils {

//   //dhow a toast message
//   displayToast(String message){
//     Fluttertoast.showToast(
//         msg: message,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         textColor: Colors.white,
//         backgroundColor: Color.fromARGB(255, 69, 22, 99),
//         fontSize: 12.0
//     );
//   }

//   //gets from sharedpreference the value of "boolvalue"
//   //to ascertain if user is already logged in
//   Future <bool> isUserLoggedIn()async{
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     bool boolValue = preferences.getBool("boolvalue")?? false;
//     return boolValue;

//   }

//     //display snackback
//   showInSnackBar(String text,BuildContext context){
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
//   }

//     //function to share image and text from app to external apps
//   void shareCourse({required String imageUrl, required String about, required BuildContext context}) async {
//     showInSnackBar("Sharing Course...", context);
//     final response = await get(Uri.parse(imageUrl));
//     final bytes = response.bodyBytes;
//     final Directory temp = await getExternalStorageDirectory();
//     final File imageFile = File('${temp.path}/tempImage.jpg');
//     imageFile.writeAsBytesSync(bytes);
//     Share.shareFiles(['${temp.path}/tempImage.jpg'], text: about,);
//   }
// }