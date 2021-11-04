abstract class KontenModel {
  final int id;
  final String judul;
  final String deskripsi;
  final String bab;
  final int kelasId;
  //final bool isbookmark;

  KontenModel({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.bab,
    required this.kelasId,
    //required this.isbookmark
  });
}
