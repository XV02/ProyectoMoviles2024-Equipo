import 'package:flutter/material.dart';

class ShoppingCartHeader extends StatelessWidget {
  const ShoppingCartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .30,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.shopping_cart_checkout_outlined,
            color: Colors.white,
            size: 100,
          ),
          Text(
            "Shopping\nCart",
            style: TextStyle(
              color: Colors.white,
              fontSize: 38,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
