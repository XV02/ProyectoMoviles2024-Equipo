
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'dart:convert';
class MangaModel{



  String ? title;
  String ? cover_url;
  double ? price;
  String ? desc;
  String ? author;

  String? getTitle(){
    return title;
  }

  String ? getImage(){
    return  cover_url;
  }

  String ? getDesc(){
    return desc;
  }
  MangaModel({this.author, this.title,  this.cover_url,  this.price,  this.desc});
  
  factory MangaModel.fromJson(Map<String,dynamic> Json){
    return MangaModel(
    
      title: Json['title'] ?? "Placeholder", 
    
      cover_url: Json['cover_url'] ?? "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAREAAAC4CAMAAADzLiguAAAAPFBMVEX///+rq6unp6fMzMykpKTp6enx8fHU1NS0tLS6urr6+vqwsLDHx8fPz8/w8PD19fXa2trh4eHl5eXAwMAzrysnAAADpklEQVR4nO2c2ZKDIBAAE6KJmsPr//91c69yKKREHav7dctl6YVhGJTdDgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAZqE5LMU1XbrvVupELUe9dO9t5PsFyZfuvY1FjWRL994GRnQeRs5NOj+rNpIVCzSMER2M6GBEByM6GNHBiI4cI+mhbdtLE12SFCO3XKnH36ryJnLDQoxU/xm2usZtWIaRWu1nUyLCSNnfh6moE0eEkYvqK4lavpBgpNA368ktYsMSjKSJbqSK2LAEI7VuRB0iNizBSGUYuURsWIIRc4zEXH8lGDkacSTm6YEEI7tMX2zKiA2LMFL185HAMJJWdcj2UIQRfZCEDJEyT5JkH7BcyzBSnrujJORY9r0BSPzXaxlGHv/pz5TJQoQUn4Mw5T1KhBi5x5LseUadnYJKRlcVPLLEGNkVt7qq0rASWtOZa7nno3KM/EB5/mGF2rSRvLdqe+Z1WzZy0Moq6ujz1IaNNJoQz1CyXSO9IPIeJD5ZyXaN6KXIJx6hZLNGKpuQ/Xl8A7BVI6nNx+MAbPTJjRopjAKCdyjZqJHWOmeeSsay+W0asQcRv1CySSM3t4/7IGmHH96ikW8JwKHkNPj0Fo3o2bvBYCiRayRt84u1a/WYkOHfK9bISam92lvW0qOZvRvzZqgwINXI+5zP0rd8dIgMHxwLNdI4+zYaRF643y6QaaT4nxlaxtXo538O3LJlGmk7fetlXKW9/ybuUCLSSC8l7WZchTt7N5S4QolEI1pK2sm4Tt5C7mPLEUoEGjH3tZ++OUoAjkHiKAwINGIWx86vHxTjmUhPib0wIM+IZV/7DpOhn/bZjyvEGbHOjGffQoLIG1thQJoRV3HsFhZEXqjWolyaEUdKqvLyl89hbYUBYUbcKWlYVP1i7p5lGfFOSb05G9JlGfHZ14ZhZiWijFwnF2IJJZKM1NP7eKCFEkFGLEfbk5D1sxJBRvz3tWFohQE5Rk6etaAflPQKA2KMpJFGyJNuYUCKkdJ1tD0JXfVSjFjfj5mMbigRYmToaHsSJf+FARlGftjXhvJ9j1GEEef7MdOhvu8xijASN4i8lXy+dJNgxPhOLw7vL80FGDnO4uN7FCbAyGx3xb0KA+s3cpntysnkGUpWb6Q8zcjjP7B6I7ODEZ1VGznfjrNzW7WRfbIA6zayFBjRWeWtxhU3X+vUi92Ofoh9CR0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMA2+AN7/TZH3Ls1kQAAAABJRU5ErkJggg==",

      price: Json['price'] ?? 0.0,

      desc: Json['desc'] ?? "Placeholder",

      author: Json['Author'] ?? "Placeholder",

      );
  }
  getDataById(String Id)async{  





     this.author = "testFromGet";
    this.price = 0.0;
    print("Getting By id");
    print(Id);

    final data  = await   http.get(Uri.parse('https://api.mangadex.org/manga?ids[]=$Id')); 
    
    var generalData =jsonCleaner_id(data.body);

    var imgUrl = await fetchCoverUrl(generalData["id"], 6);
    var jsonObj = jsonEncode(
      {
        'title':generalData["title"],
        'cover_url':imgUrl
      }
    );

    // this.title =generalData["title"];
    return MangaModel.fromJson(   {
        'title':generalData["title"],
        'cover_url':imgUrl,
        'desc':generalData["description"]
      });



  }
  getData (String MangaName)async {
    developer.log("tes: $MangaName",name: 'Fetch values');
   
    this.author = "testFromGet";
    this.price = 0.0;

    final data  = await   http.get(Uri.parse('https://api.mangadex.org/manga?title=$MangaName')); 
 
    var generalData =jsonCleaner(data.body,MangaName);

    var imgUrl = await fetchCoverUrl(generalData["id"], 6);
    var jsonObj = jsonEncode(
      {
        'title':MangaName,
        'cover_url':imgUrl
      }
    );

    // this.title =generalData["title"];
    return MangaModel.fromJson(   {
        'title':MangaName,
        'cover_url':imgUrl,
        'desc':generalData["description"]
      });  
  }
  fetchCoverUrl(mangaId,volume)async{
    String base = "https://api.mangadex.org/cover?limit=100&manga[]=$mangaId&order[volume]=asc";
    String ? imgId;
    print(base);
    final res = await http.get(Uri.parse(base));
    //
    var data =json.decode(res.body);

    for(dynamic value in data["data"]){
      if(value["attributes"]["volume"]==volume.toString()){
        imgId=value["attributes"]["fileName"];
        
      
      };
        
    }
    return 'https://uploads.mangadex.org/covers/$mangaId/$imgId';


  }
  jsonCleaner_id(res){
    var data = json.decode(res); 
    return {
"id":data["data"][0]["id"],
"title":data["data"][0]["attributes"]["title"]["en"],
"description":data["data"][0]["attributes"]["description"]["en"]


    };
  }

  jsonCleaner(res,MangaName){

    // String toFind = 'One Piece';
    var data = json.decode(res); 
    // print(data["data"]);
    for(dynamic value in  data["data"]){
      
      if(value["attributes"]["title"]["en"]== MangaName){
        print(value);
        return {
          "id":value["id"],
          "title":value["attributes"]["title"]["en"],
          "description":value["attributes"]["description"]["en"]
          
          };
      }
    }
    print(data["data"][0]);
    return {
"id":data["data"][0]["id"],
"title":data["data"][0]["attributes"]["title"]["en"],
"description":data["data"][0]["attributes"]["description"]["en"]


    };
    

  }
}