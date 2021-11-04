import 'package:kampus_gratis/model/dokumenModel.dart';
import 'package:kampus_gratis/model/videoModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:kampus_gratis/screens/konten/components/kontendokumenModel.dart';
//import 'package:kampus_gratis/screens/konten/components/kontenvideoModel.dart';
import 'dart:convert';

class DB {
  static const DATABASE_NAME = 'bookmark.db';
  static const DATABASE_VERSION = 1;
  static const TABLE_NAME_DOKUMEN = 'tb_dokumen';
  static const TABLE_NAME_VIDEO = 'tb_video';

  // DB._();
  // static final DB db = DB._();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async {
    String databasePath = await getDatabasesPath();
    return await openDatabase(
      join(databasePath, DATABASE_NAME),
      version: DATABASE_VERSION,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $TABLE_NAME_DOKUMEN (        
                id INTEGER,                   
                judul TEXT,  
                deskripsi TEXT,
                file TEXT,
                bab TEXT,
                kelas_id INTEGER
              )
        ''');
        await db.execute('''
        CREATE TABLE $TABLE_NAME_VIDEO (        
                id INTEGER,                   
                judul TEXT,  
                deskripsi TEXT,
                bab TEXT,
                kelas_id INTEGER,
                link TEXT
              )
        ''');
      },
    );
  }

// mengambil fungsi dari file konten dokumen model dari databse lokal
  Future<List<DokumenModel>> getAllDokumen() async {
    final db = await database;
    var dokumens = await db!.query(TABLE_NAME_DOKUMEN,
        columns: ['id', 'judul', 'deskripsi', 'file', 'bab', 'kelas_id']);

    List<DokumenModel> listDokumens = [];
    dokumens.forEach(
      (element) {
        listDokumens.add(DokumenModel.fromJson(element));
      },
    );
    return listDokumens;
  }

  Future<int> insertDokumen(DokumenModel dokumens) async {
    final db = await database;
    return await db!.insert(TABLE_NAME_DOKUMEN, dokumens.tojson());
  }

  Future<int> deleteWhereIdDokumen(int id) async {
    final db = await database;
    return await db!.delete(
      TABLE_NAME_DOKUMEN,
      where: 'id=?',
      whereArgs: [id],
    );
  }

  // mengambil fungsi dari file konten video model dari databse lokal
  Future<List<VideoModel>> getAllVideo() async {
    final db = await database;
    var Videos = await db!.query(TABLE_NAME_VIDEO, columns: [
      'id',
      'judul',
      'deskripsi',
      'bab',
      'kelas_id',
      'link',
    ]);

    List<VideoModel> listVideos = [];
    Videos.forEach(
      (element) {
        listVideos.add(VideoModel.fromJson(element));
      },
    );
    return listVideos;
  }

  Future<int> insertVideo(VideoModel Videos) async {
    final db = await database;
    return await db!.insert(TABLE_NAME_VIDEO, Videos.tojson());
  }

  Future<int> deleteWhereIdVideo(int id) async {
    final db = await database;
    return await db!.delete(
      TABLE_NAME_VIDEO,
      where: 'id=?',
      whereArgs: [id],
    );
  }

  Future<bool> cekvideo(int id) async {
    final db = await database;
    var Videos = await db!.query(
      TABLE_NAME_VIDEO,
      columns: [
        'id',
        'judul',
        'deskripsi',
        'bab',
        'kelas_id',
        'link',
      ],
      where: 'id=?',
      whereArgs: [id],
    );
    //untuk mengecek data
    if (Videos.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> cekdokumen(int id) async {
    final db = await database;
    var Dokumens = await db!.query(
      TABLE_NAME_DOKUMEN,
      columns: [
        'id',
        'judul',
        'deskripsi',
        'file',
        'bab',
        'kelas_id',
      ],
      where: 'id=?',
      whereArgs: [id],
    );
    //untuk mengecek data
    if (Dokumens.length > 0) {
      return true;
    } else {
      return false;
    }
  }
}
