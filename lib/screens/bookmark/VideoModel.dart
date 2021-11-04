import 'package:http/http.dart' as http;
import 'package:kampus_gratis/screens/bookmark/model.dart';
import 'dart:convert';

class VideoRepository {
  final _baseUrl = 'https://web-kg2.herokuapp.com/api/video';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<VideoModel> videomodel =
            it.map((e) => VideoModel.fromJson(e)).toList();
        return videomodel;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
