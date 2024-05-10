import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;


import './data_models/manga_data.dart';

Future<MangaModel?> getData()async{
  MangaModel? result;
  try{

    final response = await http.get(
      Uri.parse("https://api.mangadex.org/manga?publicationDemographic[]=seinen"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );

    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = MangaModel.fromJson(item);
    } else {
      print("error");
    }

  }

  catch(e){
    log(e.toString());
  }
  return result;
}


