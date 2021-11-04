class FreshArtikel {
  FreshArtikel({
    required this.message,
    required this.data,
  });

  String message;
  List<Datum> data;

  factory FreshArtikel.fromJson(Map<String, dynamic> json) => FreshArtikel(
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.judul,
    required this.gambar,
    required this.deskripsi,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String judul;
  String gambar;
  String deskripsi;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    judul: json["judul"],
    gambar: json["gambar"],
    deskripsi: json["deskripsi"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "judul": judul,
    "gambar": gambar,
    "deskripsi": deskripsi,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
