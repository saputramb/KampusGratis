import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kampus_gratis/model/courseModel.dart';
import 'package:kampus_gratis/model/dokumenModel.dart';
import 'package:kampus_gratis/model/iklanModel.dart';
import 'package:kampus_gratis/model/freshArtikelModel.dart';
import 'package:kampus_gratis/model/videoModel.dart';
import 'package:kampus_gratis/constants.dart';

class DataApiProvider {
  final _baseUrl = BaseUrl + '/api';
  Dio dio = Dio();

  Future<List<CourseModel>> getListKursus() async {
    //final response = await dio.get("$_baseUrl/kelas");
    final response = await http.get(Uri.parse(_baseUrl + '/kelas'));
    if (response.statusCode == 200) {
      Iterable it = jsonDecode(response.body);
      print(it);
      List<CourseModel> coursemodel =
          it.map((e) => CourseModel.fromJson(e)).toList();
      return coursemodel;
    } else {
      throw Exception("Failed to get courses");
    }
  }

  Future<List<VideoModel>> getListVideo(int id) async {
    //final response = await dio.get("$_baseUrl/kelas");
    final response = await http.get(Uri.parse(_baseUrl + '/video'));
    if (response.statusCode == 200) {
      Iterable it = jsonDecode(response.body);
      print(it);
      List<VideoModel> list = it.map((e) => VideoModel.fromJson(e)).toList();
      List<VideoModel> videomodel =
          list.where((element) => element.kelasId == id).toList();
      return videomodel;
    } else {
      throw Exception("Failed to get video");
    }
  }

  Future<List<DokumenModel>> getListDokumen(int id) async {
    //final response = await dio.get("$_baseUrl/kelas");
    final response = await http.get(Uri.parse(_baseUrl + '/dokumen'));
    if (response.statusCode == 200) {
      Iterable it = jsonDecode(response.body);
      print(it);
      List<DokumenModel> list =
          it.map((e) => DokumenModel.fromJson(e)).toList();
      List<DokumenModel> dokumenmodel =
          list.where((element) => element.kelasId == id).toList();
      return dokumenmodel;
    } else {
      throw Exception("Failed to get document");
    }
  }

  Future<List<IklanModel>> getListIklan() async {
    //final response = await dio.get("$_baseUrl/kelas");
    final response = await http.get(Uri.parse(_baseUrl + '/iklan'));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> data = map["data"];
      print(data);
      List<IklanModel> iklanmodel =
          data.map((e) => IklanModel.fromJson(e)).toList();
      return iklanmodel;
    } else {
      throw Exception("Failed to get iklan");
    }

    //   final String urlGambar = 'https://web-kg2.herokuapp.com/api/iklan';
    // final String urlFreshArtikel =
    //     'https://web-kg2.herokuapp.com/api/artikel/new';

    // late GambarDetail gambarDetail;
    // late FreshArtikel freshArtikel;
    // var loading = true;
    // Future<Null> initial() async {
    //   final response = await http.get(Uri.parse(urlGambar));
    //   print(response.body);
    //   print(response.statusCode);
    //   if (response.statusCode == 200) {
    //     final data = jsonDecode(response.body);
    //     gambarDetail = GambarDetail.fromJson(data);
    //     final response2 = await http.get(Uri.parse(urlFreshArtikel));
    //     print(response2.body);
    //     print(response2.statusCode);
    //     if (response2.statusCode == 200) {
    //       final data2 = jsonDecode(response2.body);
    //       freshArtikel = FreshArtikel.fromJson(data2);
    //     }
    //   }
    //   loading = false;
    //   setState(() {});
    // }
  }

  Future<List<FreshArtikelModel>> getListFreshArtikel(int id) async {
    //final response = await dio.get("$_baseUrl/kelas");
    final response = await http.get(Uri.parse(_baseUrl + '/artikel/new'));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> data = map["data"];
      print(data);
      List<FreshArtikelModel> freshartikelmodel =
      data.map((e) => FreshArtikelModel.fromJson(e)).toList();
      return freshartikelmodel;
    } else {
      throw Exception("Failed to get freshArtikel");
    }
  }

}
