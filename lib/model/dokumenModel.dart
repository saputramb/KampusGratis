import 'package:kampus_gratis/model/kontenModel.dart';

class DokumenModel implements KontenModel {
  @override
  final int id;
  @override
  final String judul;
  @override
  final String deskripsi;
  final String file;
  @override
  final String bab;
  @override
  final int kelasId;
  //@override
  //final bool isbookmark;

  DokumenModel({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.bab,
    required this.file,
    required this.kelasId,
    //required this.isbookmark,
  });

  factory DokumenModel.fromJson(Map<String, dynamic> json) {
    return DokumenModel(
      id: json['id'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
      bab: json['bab'],
      file: json['file'],
      kelasId: json['kelas_id'],
      //isbookmark: json[false],
    );
  }
  Map<String, dynamic> tojson() {
    return {
      'id': this.id,
      'judul': this.judul,
      'deskripsi': this.deskripsi,
      'bab': this.bab,
      'file': this.file,
      'kelas_id': this.kelasId,
    };
  }
}
