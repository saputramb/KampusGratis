import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/components/primary_button.dart';
import 'package:kampus_gratis/services/auth_controller.dart';

class Profil extends StatefulWidget {
  Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: Column(children: <Widget>[
        Flexible(
            flex: 1,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.blue,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 70,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                          child: new Image.asset(
                            'assets/images/pp.png',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Nama Pengguna",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            )),
        Flexible(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: new ListView(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                           onPressed: () {
                            Navigator.pushNamed(context, '/edit');
                          },
                          style: OutlinedButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize: Size(0, 30),
                              side: BorderSide(color: Colors.blue.shade900)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Text(
                              "Lengkapi Profile",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Akun",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildCard(
                    new Image.asset(
                      'images/gb.png',
                      width: 80.0,
                    ),
                    "Kelas Saya",
                  ),
                  buildCard(
                      new Image.asset(
                        'assets/images/gb.png',
                        width: 80.0,
                      ),
                      "Transkrip"),
                  buildCard(
                      new Image.asset(
                        'images/gb.png',
                        width: 80.0,
                      ),
                      "Conferencing"),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
        Column(
          children: [
            Container(
              color: Colors.white,
              width: 1000,
              height: 80,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 70,
                    height: 25,
                    color: Colors.white,
                    child: Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xffF18265),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () => authC.logout(),
                          child: Text(
                            "Keluar",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffffffff),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Nama Pengguna",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
    ));
  }

  Card buildCard(ImageData, String text) {
    return Card(
      elevation: 5,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8),
            child: new Image.asset('assets/images/gb.png'),
            width: 80.0,
          ),
          Text(text)
        ],
      ),
    );
  }
}
