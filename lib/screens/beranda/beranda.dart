import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/components/Beranda/main_menu.dart';
//import 'package:kampus_gratis/components/Beranda/model_artikel.dart';
import 'package:kampus_gratis/components/user_menu_bar.dart';
import 'package:kampus_gratis/constants.dart';
import 'package:http/http.dart' as http;
import 'package:kampus_gratis/model/iklanModel.dart';
import 'package:kampus_gratis/model/freshArtikelModel.dart';

import 'package:kampus_gratis/services/data_Repository.dart';
import 'package:kampus_gratis/services/data_provider.dart';
import 'package:kampus_gratis/constants.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  List<IklanModel> iklanmodel = [];
  DataApiRepository repository = DataApiRepository();

  List<FreshArtikelModel> freshartikelmodel = [];
  DataApiRepository repository2 = DataApiRepository();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      iklanmodel = await repository.getListIklan();
      freshartikelmodel = await repository2.getListFreshArtikel();
      setState(() {});
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: UserMenuBar(),
        elevation: 0,
      ),
      body: Stack(
        children: [
          //background(),
          SingleChildScrollView(
              child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  // carouselSlider(),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      "Fitur Kami",
                      style: TextStyle(
                        fontSize: 21.0,
                        color: AppColor.primaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MainMenu(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 15),
                    child: Text(
                      'Artikel',
                      style: TextStyle(
                          fontSize: 21.0,
                          color: AppColor.primaryTextColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 10),
                  freshArtikel(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget carouselSlider() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          //itemCount: gambarDetail.data.length,
          itemCount: 3,
          options: CarouselOptions(
            // aspectRatio: 334 / 97,
            height: 140,
            viewportFraction: 0.95,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 7),
            autoPlayAnimationDuration: Duration(milliseconds: 2000),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    child: CachedNetworkImage(
                  // 'gambarDetail.data[index].gambar',
                  imageUrl: "${BaseUrl}/${iklanmodel[index].gambar}",
                  //"hello",
                  width: 350,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/main-logo.png'),
                )),
              ),
            );
          },
        ),
      ],
    ));
  }
  // Widget freshArtikel() {
  //   return Row
  // }

  Widget freshArtikel() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: [
            Container(
              height: 200,
              width: 240,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 6,
                    color: Colors.black38,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 250,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/images/Art 1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      child: Text(
                        'Covid-19 global case ...',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Lorem ipsum dolor sit amet',
                        style: TextStyle(color: Colors.black38, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 200,
              width: 240,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 6,
                    color: Colors.black38,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 250,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/images/Art 2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      child: Text(
                        'Covid-19 global case ...',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Lorem ipsum dolor sit amet',
                        style: TextStyle(color: Colors.black38, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 200,
              width: 240,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 6,
                    color: Colors.black38,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 250,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/images/Art 1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      child: Text(
                        'Covid-19 global case ...',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Lorem ipsum dolor sit amet',
                        style: TextStyle(color: Colors.black38, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 200,
              width: 240,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 6,
                    color: Colors.black38,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 250,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/images/Art 2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      child: Text(
                        'Covid-19 global case ...',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Lorem ipsum dolor sit amet',
                        style: TextStyle(color: Colors.black38, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

mixin HEAD {}
