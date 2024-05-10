

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/auth/bloc/bloc/auth_bloc.dart';
import 'package:proyecto_final/pages/details_page/details_page.dart';
import 'package:proyecto_final/pages/shopping_cart/shopping_cart_page.dart';
import 'package:proyecto_final/pages/landing_page/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyecto_final/firebase_options.dart';
import 'package:proyecto_final/pages/login_page/login_page.dart';
import 'package:proyecto_final/providers/manga_prov_class.dart';
import 'package:proyecto_final/shared/widgets/loading_page.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/shared/widgets/manga_item.dart';

final List<String> items =["801513ba-a712-498c-8f57-cae55b38cc92", "52ede55c-1584-4019-b85b-3902a423c3ab","a1c7c817-4e59-43b7-9365-09675a149a6f"];
void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=> MangaClassProvider(),
    child: const MyApp(),)
    
  );
} 
// children: [SizedBox(child:mangaInfo(),width: MediaQuery.of(context).size.width*.99,height:MediaQuery.of(context).size.height*.99,),]
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){

             
         
     return MaterialApp(
      title: "test",
    home: Container(
      height: double.infinity,
      width: double.infinity,
      
      child: 

      
     
      
            SizedBox(child:mangaInfo(mangaName: items),width: 410,height:250)
          
        ),
      





    );
      
     
  }
}