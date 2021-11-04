class DokumenModel {
  final int id;
  final String judul;
  final String deskripsi;

  DokumenModel(
      {required this.id, required this.judul, required this.deskripsi});

  factory DokumenModel.fromJson(Map<String, dynamic> json) {
    return DokumenModel(
      id: json['id'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
    );
  }
}

class VideoModel {
  final int id;
  final String judul;
  final String deskripsi;

  VideoModel({required this.id, required this.judul, required this.deskripsi});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
    );
  }
}
