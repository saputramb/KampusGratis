class CourseModel {
  final int id;
  final String nama;
  final String deskripsi;

  CourseModel({required this.id, required this.nama, required this.deskripsi});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
    );
  }
}
