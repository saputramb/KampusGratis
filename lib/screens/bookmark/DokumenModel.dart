import 'package:http/http.dart' as http;
import 'package:kampus_gratis/screens/bookmark/model.dart';
import 'dart:convert';

class DokumenRepository {
  final _baseUrl = 'https://web-kg2.herokuapp.com/api/dokumen';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<DokumenModel> dokumenmodel =
            it.map((e) => DokumenModel.fromJson(e)).toList();
        return dokumenmodel;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
