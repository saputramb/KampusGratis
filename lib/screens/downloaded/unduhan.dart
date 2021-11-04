import 'package:flutter/material.dart';
import 'package:kampus_gratis/screens/downloaded/components/list_files.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class Unduhan extends StatefulWidget {
  const Unduhan({Key? key}) : super(key: key);

  @override
  State<Unduhan> createState() => _UnduhanState();
}

class _UnduhanState extends State<Unduhan> {
  //Langsung dijalankan saat halaman ini dibuka
  @override
  void initState() {
    _requestPermission();
    super.initState();
  }
  
  //Mengarahkan ke halaman ListFiles() setelah diberikan izin akses
  void showListFile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ListFiles(),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Akses telah ditolak permanen, ubah melalui pengaturan.'),
      ),
    );
  }

  // ================================= Permission Handler ======================
  PermissionStatus? _perrmissionGranted;
  PermissionStatus? _perrmissionGranted2;

  Future<void> _requestPermission() async {
    print(_perrmissionGranted);
    
    // Android 11 keatas
    if (_perrmissionGranted == PermissionStatus.permanentlyDenied || _perrmissionGranted2 == PermissionStatus.permanentlyDenied) {
      final PermissionStatus permissionRequestedResult = await Permission.manageExternalStorage.request();

      setState(() {
        _perrmissionGranted = permissionRequestedResult;
        _showToast(context);
      });
    } else if (_perrmissionGranted != PermissionStatus.granted) {
      final PermissionStatus permissionRequestedResult = await Permission.manageExternalStorage.request();
      final PermissionStatus permissionRequestedResult2 = await Permission.storage.request();

      if (permissionRequestedResult == PermissionStatus.granted && permissionRequestedResult2 == PermissionStatus.granted) {
        showListFile();
      }

      if (permissionRequestedResult == PermissionStatus.restricted) {
        showListFile();
      }

      setState(() {
        _perrmissionGranted = permissionRequestedResult;
        _perrmissionGranted2 = permissionRequestedResult2;
      });
    }  else if (_perrmissionGranted == PermissionStatus.granted) {
      showListFile();
    }


    // Android 10 kebawah
    // if (_perrmissionGranted == PermissionStatus.permanentlyDenied) {
    //   final PermissionStatus permissionRequestedResult = await Permission.storage.request();

    //   setState(() {
    //     _perrmissionGranted = permissionRequestedResult;
    //     _showToast(context);
    //   });
    // } else if (_perrmissionGranted != PermissionStatus.granted) {
    //   final PermissionStatus permissionRequestedResult = await Permission.storage.request();

    //   if (permissionRequestedResult == PermissionStatus.granted) {
    //     showListFile();
    //   }

    //   setState(() {
    //     _perrmissionGranted = permissionRequestedResult;
    //   });
    // } else if (_perrmissionGranted == PermissionStatus.granted) {
    //   showListFile();
    // }
  }
  // ============================================================================

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

        body: TabBarView(
          children: <Widget>[
            // BodyVideo(),
            Center(
              child: ElevatedButton(
                onPressed: _requestPermission,
                child: const Text('Izinkan Akses')),
            ),
            Center(
              child: ElevatedButton(
                onPressed: _requestPermission, 
                child: const Text('Izinkan Akses')),
            ),
            // BodyDocument(),
          ],
        ),
      ),
    );
  }
}
