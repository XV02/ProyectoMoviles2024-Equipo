import 'package:flutter/material.dart';
import 'package:proyecto_final/details_page.dart';
import 'package:proyecto_final/shopping_cart.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.red,
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: ShoppingCart(),
      ),
    );
  }
}
