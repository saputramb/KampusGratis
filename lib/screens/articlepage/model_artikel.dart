import 'dart:convert';

ArticleData articleDataFromJson(String str) => ArticleData.fromJson(json.decode(str));
String articleDataToJson(ArticleData data) => json.encode(data.toJson());

class ArticleData {
    final String message;
    final List<ArticleDataList> data;
    
    ArticleData({
        required this.message,
        required this.data,
    });    

    factory ArticleData.fromJson(Map<String, dynamic> json) => ArticleData(
        message: json["message"],
        data: List<ArticleDataList>.from(json["data"].map((x) => ArticleDataList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ArticleDataList {
    ArticleDataList({
        // required this.id,
        required this.judul,
        required this.gambar,
        required this.deskripsi,
        // required this.createdAt,
        // required this.updatedAt,
    });

    // int id;
    String judul;
    String gambar;
    String deskripsi;
    // DateTime createdAt;
    // DateTime updatedAt;

    factory ArticleDataList.fromJson(Map<dynamic, dynamic> json) => ArticleDataList(
        // id: json["id"],
        judul: json["judul"],
        gambar: json["gambar"],
        deskripsi: json["deskripsi"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<dynamic, dynamic> toJson() => {
        // "id": id,
        "judul": judul,
        "gambar": gambar,
        "deskripsi": deskripsi,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
    };
}
