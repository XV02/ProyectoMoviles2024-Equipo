import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/bloc/shopping_cart/shopping_cart_bloc.dart';

class ShoppingCartList extends StatelessWidget {
  final List shoppingCart;

  const ShoppingCartList({
    super.key,
    required this.shoppingCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .345,
      width: double.infinity,
      child: ListView.builder(
        itemCount: shoppingCart.length,
        itemBuilder: (BuildContext context, int index) {
          Color bgColor =
              index % 2 != 0 ? Colors.red : Color.fromARGB(255, 243, 52, 38);
          return Container(
            height: 85,
            width: double.infinity,
            decoration: BoxDecoration(color: bgColor),
            child: ListTile(
              title: Text(
                '${shoppingCart[index]['title']} #${shoppingCart[index]['volume']}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              trailing: Container(
                width: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Add a button to decrease the quantity, then the quantity, then a button to increase the quantity
                    IconButton(
                      icon: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        // Decrease the quantity with the event
                        BlocProvider.of<ShoppingCartBloc>(context).add(
                          RemoveFromShoppingCart(
                            shoppingCart[index]['id'],
                          ),
                        );
                      },
                    ),
                    Text(
                      '${shoppingCart[index]['quantity']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        // Increase the quantity with the event
                        BlocProvider.of<ShoppingCartBloc>(context).add(
                          AddToShoppingCart(
                            shoppingCart[index]['mangaId'],
                            shoppingCart[index]['volume'],
                          ),
                        );
                      },
                    ),
                    Text(
                      '\$100',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Remove from shopping cart with the event
                        BlocProvider.of<ShoppingCartBloc>(context).add(
                          RemoveAllFromShoppingCart(
                            shoppingCart[index]['id'],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
