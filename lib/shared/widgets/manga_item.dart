import 'package:flutter/material.dart';

import 'package:proyecto_final/data_models/manga_data.dart';

String urlDef =
    'https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png';

Future<List<MangaModel>?> getPostData(List<String> MangaName) async {
  List<MangaModel> _post = [];
  for (var i = 0; i < MangaName.length; i++) {
    MangaModel toAdd = MangaModel();
    dynamic curr = await toAdd.getDataById(MangaName[i], '6');
    _post.add(curr);
  }

  return _post;
}

class mangaInfo extends StatefulWidget {
  final List<String> mangaName;

  const mangaInfo({super.key, required this.mangaName});

  @override
  State<mangaInfo> createState() => _mangaInfo();
}

class _mangaInfo extends State<mangaInfo> {
  // MangaModel _manga = MangaModel(title: "Place Holder", cover_url: "None", price:1.1, desc:"10%");

  @override
  Widget build(BuildContext contexts) {
    return Scaffold(
        body: Container(
      width: 500,
      child: Row(
        children: [
          FutureBuilder(
            future: getPostData(widget.mangaName),
            builder: (BuildContext contexts, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data == null) {
                  return const Center(child: Text('Something went wrong'));
                }

                return Container(
                    width: 390,
                    child: ListView.builder(
                        itemCount: snapshot.data.length ?? 0,
                        itemBuilder: (contexts, index) {
                          return Container(
                              padding: EdgeInsets.all(0),
                              child: Card(
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(margin: EdgeInsets.all(10)),
                                        SizedBox(
                                          child: Image(
                                              image: NetworkImage(snapshot
                                                          .data[index]
                                                          .getImage() ==
                                                      null
                                                  ? urlDef
                                                  : snapshot.data![index]
                                                      .getImage()),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .7,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .7),
                                          width: 100,
                                          height: 300,
                                        ),
                                        Container(margin: EdgeInsets.all(5)),
                                        VerticalDivider(
                                          width: 20,
                                          thickness: 2,
                                          indent: 10,
                                          endIndent: 10,
                                          color: const Color.fromARGB(
                                              255, 222, 220, 220),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(10),
                                              child: Container(
                                                child: Center(
                                                  child: Text(snapshot
                                                              .data[index]
                                                              .getTitle() ==
                                                          null
                                                      ? 'placeholder'
                                                      : snapshot.data![index]
                                                          .getTitle()),
                                                ),
                                                height: 50,
                                                width: 100,
                                              ),
                                              height: 20,
                                              width: 100,
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(10),
                                              child: Container(
                                                child: Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Text(snapshot
                                                              .data![index]
                                                              .getDesc() ==
                                                          null
                                                      ? 'placeholder'
                                                      : snapshot.data![index]
                                                          .getDesc()),
                                                ),
                                                height: 50,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 244, 240, 240),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              height: 130,
                                              width: 200,
                                            ),
                                          ],
                                        ),
                                      ])));
                        }));
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    )
        // floatingActionButton: FloatingActionButton(onPressed: (){
        //   final text= context.read  <MangaClassProvider>();
        //   text.getPostData();

        // },child: Text("Random"),),

        );
  }
}
