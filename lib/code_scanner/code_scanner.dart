import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class code_scanner extends StatelessWidget {
  const code_scanner({super.key});

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
          child: const Center(child: Text('Code Scanner',style: TextStyle(
          decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.dashed, decorationColor: Colors.white),),)
          
          
          
          ),

          Center(
            
             child: Container( 

              margin: const EdgeInsets.only(top:100),
              
              child: const Icon(Icons.qr_code_2_outlined, size:200),color: Colors.white, )
          ),
          
          
          Center(
            
             child: Container( 

              margin: const EdgeInsets.only(top:100),
              
              child: const Text('Open your camera ',  style: TextStyle(fontSize: 25, color:Color.fromARGB(186, 255, 255, 255),
            decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.dashed, decorationColor: Colors.red)
          )

          ))
















          




      ],),
    );
  }
}
