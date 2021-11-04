import 'isi_article.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model_artikel.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFF2995B2),
            leading: GestureDetector(
                onTap: () {
                  print("asd");
                },
                child: const Icon(Icons.arrow_back_ios)),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.more_vert,
                    ),
                  )),
            ]),
        body: SafeArea(
          child: FutureBuilder<List<ArticleDataList>>(
            future: _fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return (ListView.builder(
                    itemExtent: 140,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IsiArticle(
                                          judul: snapshot.data![index].judul,
                                          isiArtikel:
                                              snapshot.data![index].deskripsi,
                                          gambar: snapshot.data![index].gambar,
                                        )));
                          },
                          child: Card(
                            elevation: 5.0,
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  color: const Color(0xFF2995B2),
                                  width: 140,
                                  height: double.infinity,
                                  child: Image.network(
                                    snapshot.data![index].gambar,
                                    // width: 125,
                                    // height: 100,
                                    fit: BoxFit.cover,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return const Icon(Icons.error, color: Colors.white,);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6),
                                        child: Text(
                                          snapshot.data![index].judul,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 6.0,
                                            left: 12.0,
                                            right: 12.0),
                                        child: Text(
                                          snapshot.data![index].deskripsi,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ));
                    }));
              } else if (snapshot.hasError) {
                return const Center(
                    child: Text(
                        "Terjadi masalah saat menghubungkan ke server, coba ulangi lagi"));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Future<List<ArticleDataList>> _fetchData() async {
    final response =
        await http.get(Uri.parse('https://web-kg2.herokuapp.com/api/artikel'));
    Map<String, dynamic> map = jsonDecode(response.body);
    List<dynamic> data = map['data'];
    List<ArticleDataList> articleData = createArticleList(data);
    return articleData;
  }

  List<ArticleDataList> createArticleList(List data) {
    List<ArticleDataList> daftarArticle = [];
    for (int i = 0; i < data.length; i++) {
      String judul = data[i]['judul'];
      String deskripsi = data[i]['deskripsi'];
      String gambarawal = data[i]['gambar'];
      String linkKG = 'https://web-kg2.herokuapp.com/';
      String gambar = (linkKG + gambarawal);

      ArticleDataList konten =
          ArticleDataList(judul: judul, gambar: gambar, deskripsi: deskripsi);
      daftarArticle.add(konten);
    }
    return daftarArticle;
  }
}
