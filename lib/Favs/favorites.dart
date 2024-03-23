import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        
      
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
        Container( 
          
          width: MediaQuery.of(context).size.width, 
          height:MediaQuery.of(context).size.height*.20,
          decoration:  BoxDecoration(
            border: Border.all(color: Colors.red),
            color: Colors.white, 
            borderRadius: const BorderRadius.all(
              Radius.circular(10)
            )
            
          ),
          child: const Center(child: Text('Favorites',style: TextStyle(
          decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.dashed, decorationColor: Colors.white),),),
          
          
          
          ),
          Container( 
        
          margin: const EdgeInsets.all(30),
          width: MediaQuery.of(context).size.width, 
          height:MediaQuery.of(context).size.height*.1,
          decoration: const BoxDecoration(

              borderRadius:  BorderRadius.all(
              Radius.circular(10)
              ),
              color: Color.fromARGB(255, 197, 61, 51), 
          ),
          child:  Row(children: [
            Container(margin: const EdgeInsets.only(right: 20,left: 20),child:  const Icon(Icons.photo,color: Colors.white, size: 50,)),

            Container(margin: const EdgeInsets.only(right: 10), child:  const Text('Brezerk 1',  style: TextStyle(fontSize: 25, color:Color.fromARGB(186, 255, 255, 255),
            decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.dashed, decorationColor: Color.fromARGB(255, 197, 61, 51)),),),
            const VerticalDivider(width: 10, indent: 8,endIndent: 10,color: Colors.red,),  
            Container(margin: const EdgeInsets.only(right: 10,left: 10),child:  const Icon(Icons.close ,color: Colors.white, size: 20,)),
            Container(margin: const EdgeInsets.only(left: 10),child:  const Icon(Icons.shopping_cart ,color: Colors.white, size: 25,)),

            ],)
            ),


            Container( 
        
          margin: const EdgeInsets.all(30),
          width: MediaQuery.of(context).size.width, 
          height:MediaQuery.of(context).size.height*.1,
          decoration: const BoxDecoration(

              borderRadius:  BorderRadius.all(
              Radius.circular(10)
              ),
              color: Color.fromARGB(255, 197, 61, 51), 
          ),
          child:  Row(children: [
            Container(margin: const EdgeInsets.only(right: 20,left: 20),child:  const Icon(Icons.photo,color: Colors.white, size: 50,)),

            Container(margin: const EdgeInsets.only(right: 10), child:  const Text('Brezerk 2',  style: TextStyle(fontSize: 25, color:Color.fromARGB(186, 255, 255, 255),
            decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.dashed, decorationColor: Color.fromARGB(255, 197, 61, 51)),),),
            const VerticalDivider(width: 10, indent: 8,endIndent: 10,color: Colors.red,),  
            Container(margin: const EdgeInsets.only(right: 10,left: 10),child:  const Icon(Icons.close ,color: Colors.white, size: 20,)),
            Container(margin: const EdgeInsets.only(left: 10),child:  const Icon(Icons.shopping_cart ,color: Colors.white, size: 25,)),

            ],)
            ),

















          




      ],),
    );
  }
}

