import 'package:flutter/material.dart';
import 'package:kampus_gratis/constants.dart';
import 'package:kampus_gratis/screens/konten/components/Itemcard_video.dart';
import 'package:kampus_gratis/model/videoModel.dart';
import 'package:kampus_gratis/services/data_Repository.dart';
import 'package:kampus_gratis/services/data_provider.dart';
import 'package:kampus_gratis/services/listener.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyVideo extends StatefulWidget {
  //membuat properti variable
  final int id;
  const BodyVideo({Key? key, required this.id}) : super(key: key);

  @override
  _BodyVideo createState() => _BodyVideo();
}

class _BodyVideo extends State<BodyVideo> {
  List<VideoModel> videomodel = [];
  DataApiRepository repository = DataApiRepository();

  @override
  void initState() {
    getData();
    addIntToSF();
    super.initState();
  }

  getData() async {
    videomodel = await repository.getListVideo(widget.id);
    setState(() {});
  }

  addIntToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('selected_kelasid', widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
        itemCount: videomodel.length,
        itemBuilder: (context, int key) {
          return ItemCard(
            id: widget.id,
            index: key,
            konten: videomodel,
            press: () {
              Navigator.pushNamed(context, '/video');
            },
            cardcolor: AppColor.fixmaincolor,
            cardicon: Icons.download,
          );
        },
      ),
    );
  }
}
