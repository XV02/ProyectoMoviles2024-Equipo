import 'package:flutter/material.dart';
import 'package:proyecto_final/service.dart';

import '../data_models/manga_data.dart';


class MangaClassProvider extends ChangeNotifier{

  bool loading = false;
  List<MangaModel>  ? _post;
  get post => _post;

  Future<List<MangaModel>?>getPostData(List<String> MangaName) async {
      loading = true;
        List<MangaModel>  ? _post;
      for (var i = 0; i < MangaName.length-1; i++) {
             print("Fetching From provider ${MangaName[i]}");
            MangaModel toAdd  = MangaModel();
            toAdd.getData(MangaName[i]);
            _post?.add(toAdd);
           
  
      }
       loading = false;
 
    
      return _post;
  }

}