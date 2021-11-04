class GambarDetail {
  GambarDetail({
    required this.message,
    required this.data,
  });

  String message;
  List<IklanModel> data;

  factory GambarDetail.fromJson(Map<String, dynamic> json) => GambarDetail(
        message: json["message"],
        data: List<IklanModel>.from(
            json["data"].map((x) => IklanModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class IklanModel {
  IklanModel({
    required this.id,
    required this.gambar,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String gambar;
  DateTime createdAt;
  DateTime updatedAt;

  factory IklanModel.fromJson(Map<String, dynamic> json) => IklanModel(
        id: json["id"],
        gambar: json["gambar"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gambar": gambar,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
