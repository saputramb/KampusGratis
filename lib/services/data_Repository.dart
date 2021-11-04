import 'package:kampus_gratis/model/courseModel.dart';
import 'package:kampus_gratis/model/dokumenModel.dart';
import 'package:kampus_gratis/model/iklanModel.dart';
import 'package:kampus_gratis/model/freshArtikelModel.dart';
import 'package:kampus_gratis/model/videoModel.dart';
import 'data_provider.dart';

class DataApiRepository {
  final dataApiProvider = DataApiProvider();

  Future<List<CourseModel>> getListKursus() => dataApiProvider.getListKursus();

  Future<List<VideoModel>> getListVideo(id) => dataApiProvider.getListVideo(id);

  Future<List<DokumenModel>> getListDokumen(id) =>
      dataApiProvider.getListDokumen(id);

  Future<List<IklanModel>> getListIklan() => dataApiProvider.getListIklan();

  Future<List<FreshArtikelModel>> getListFreshArtikel(id) => dataApiProvider.getListFreshArtikel(id);
}
