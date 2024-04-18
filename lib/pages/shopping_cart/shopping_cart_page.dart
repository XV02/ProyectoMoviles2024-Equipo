import 'package:flutter/material.dart';
import 'package:proyecto_final/pages/shopping_cart/shopping_cart_app_bar.dart';
import 'package:proyecto_final/pages/shopping_cart/shopping_cart_footer.dart';
import 'package:proyecto_final/pages/shopping_cart/shopping_cart_header.dart';
import 'package:proyecto_final/pages/shopping_cart/shopping_cart_list.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShoppingCartAppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ShoppingCartHeader(),
            ShoppingCartList(),
            ShoppingCartFooter(),
          ],
        ),
      ),
    );
  }
}
