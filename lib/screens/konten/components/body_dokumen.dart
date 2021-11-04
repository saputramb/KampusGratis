import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/constants.dart';
import 'package:kampus_gratis/screens/bookmark/dokumen.dart';
import 'package:kampus_gratis/screens/konten/components/Itemcard_dokumen.dart';
import 'package:kampus_gratis/model/dokumenModel.dart';
import 'package:kampus_gratis/services/data_Repository.dart';

class BodyDokumen extends StatefulWidget {
  //membuat properti variable
  final int id;
  const BodyDokumen({Key? key, required this.id}) : super(key: key);

  @override
  _BodyDokumen createState() => _BodyDokumen();
}

class _BodyDokumen extends State<BodyDokumen> {
  List<DokumenModel> dokumenmodel = [];
  DataApiRepository repository = DataApiRepository();

  getData() async {
    dokumenmodel = await repository.getListDokumen(widget.id);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  // Future<Null> _refresh() {
  //   return getData().then((_dokumenmodel) {
  //     setState(() => dokumenmodel = _dokumenmodel);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
        itemCount: dokumenmodel.length,
        itemBuilder: (context, int key) {
          return ItemCard(
            id: widget.id,
            index: key,
            konten: dokumenmodel,
            press: () {
              Get.to(HalamanItemPage(dokumen: dokumenmodel[0]));
            },
            cardcolor: AppColor.fixmaincolor,
            cardicon: Icons.bookmark,
          );
        },
      ),
    );
  }
}
