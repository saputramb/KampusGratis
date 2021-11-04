import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kampus_gratis/screens/beranda/beranda.dart';
import 'package:kampus_gratis/screens/downloaded/unduhan.dart';
import 'package:kampus_gratis/screens/profil/editprofil.dart';
import 'package:kampus_gratis/screens/unduh.dart';
import 'package:kampus_gratis/screens/bookmark/bookmarks.dart';
import 'package:kampus_gratis/screens/notifikasi.dart';
import 'package:kampus_gratis/screens/profil/profil.dart';

class Bottom_Navbar extends StatefulWidget {
  const Bottom_Navbar({Key? key}) : super(key: key);

  @override
  _Bottom_NavbarState createState() => _Bottom_NavbarState();
}

class _Bottom_NavbarState extends State<Bottom_Navbar> {
  int currentIndex = 0;
  final List<Widget> body = [
    new Beranda(),
    new Unduhan(),
    new Bookmarks(),
    new Notifikasi(),
    new Profil()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: body[currentIndex],
        bottomNavigationBar:
            BottomNavigationBar(
              onTap: ontap,
                currentIndex: currentIndex,
                items: [
                  BottomNavigationBarItem(
                    label: 'Beranda',
                    icon: ImageIcon(
                      AssetImage('assets/icons/home_3.png'),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Unduh',
                    icon: ImageIcon(
                      AssetImage('assets/icons/Arrow_Down_rectangle.png'),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Bookmarks',
                    icon: ImageIcon(
                      AssetImage('assets/icons/bookmark.png'),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Notifikasi',
                    icon: ImageIcon(
                      AssetImage('assets/icons/bell.png'),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Profil',
                    icon: ImageIcon(
                      AssetImage('assets/icons/user_2.png'),
                    ),
                  ),
                ],
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black,
              showSelectedLabels: true,
            ),
    );
  }
  void ontap(int index){
    setState(() {
      currentIndex = index;
    });
  }
}
