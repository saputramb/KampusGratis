import 'package:kampus_gratis/model/kontenModel.dart';

class VideoModel implements KontenModel {
  @override
  final int id;
  @override
  final String judul;
  final String link;
  @override
  final String deskripsi;
  @override
  final String bab;
  @override
  final int kelasId;
  //@override
  //final bool isbookmark;

  VideoModel({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.bab,
    required this.kelasId,
    required this.link,
    //required this.isbookmark,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
      bab: json['bab'],
      link: json['link'],
      kelasId: json['kelas_id'],
      //isbookmark: json[false],
    );
  }
  //dari dokumen model di ubah ke jenis map
  Map<String, dynamic> tojson() {
    return {
      'id': this.id,
      'judul': this.judul,
      'deskripsi': this.deskripsi,
      'bab': this.bab,
      'kelas_id': this.kelasId,
      'link': this.link,
    };
  }
}
