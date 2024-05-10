import 'dart:async';

import 'package:flutter/material.dart';
import 'package:proyecto_final/data_models/manga_data.dart';
import 'package:proyecto_final/pages/individual_item/manga_item_appbar.dart';

class MangaItemArguments {
  final String id;

  MangaItemArguments(this.id);
}

class MangaItem extends StatefulWidget {
  const MangaItem({Key? key}) : super(key: key);

  @override
  State<MangaItem> createState() => _manga_item();
}

class _manga_item extends State<MangaItem> {
  var data = null;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () => getD());
  }

  Future<void> getD() async {
    final MangaItemArguments args =
        ModalRoute.of(context)!.settings.arguments as MangaItemArguments;
    MangaModel toAdd = MangaModel();

    data = await toAdd.getDataById(args.id, '3');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MangaItemAppBar(),
        body: data == null
            ? const Center(child: CircularProgressIndicator())
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 40.0),
                        width: 500,
                        height: 140,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: Text(
                            '${data.getTitle()}',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.dashed,
                                decorationColor: Colors.white),
                          ),
                        )),

                    // Center(

                    //    child: Container(
                    //     height: 200,
                    //     width: 200,

                    //     margin: const EdgeInsets.only(top:100),

                    //     child: const Icon(Icons.qr_code_2_outlined, size:200),color: Colors.white, )
                    // ),

                    //   Center(

                    //      child: Container(

                    //       margin: const EdgeInsets.only(top:100),
                    //       width: 100,
                    //       height: 100,

                    //       child: const Text('Open your camera ',  style: TextStyle(fontSize: 25, color:Color.fromARGB(186, 255, 255, 255),
                    //     decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.dashed, decorationColor: Colors.red)
                    //   )

                    //   )),
                  ],
                ),
              ));
  }
}
