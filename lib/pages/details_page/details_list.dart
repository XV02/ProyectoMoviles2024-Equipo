import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/bloc/shopping_cart/shopping_cart_bloc.dart';
import 'package:proyecto_final/pages/individual_item/manga.dart';

class DetailsList extends StatelessWidget {
  final data;
  final id;

  const DetailsList({
    super.key,
    required this.data,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .45,
      width: double.infinity,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          Color bgColor =
              index % 2 != 0 ? Colors.red : Color.fromARGB(255, 243, 52, 38);
          return GestureDetector(
            onTap: () {
              // Move to the individual item page
              Navigator.pushNamed(context, '/MangaItem',
                  arguments:
                      MangaItemArguments(id: id, volume: '${index + 1}'));
            },
            child: Container(
              height: 85,
              width: double.infinity,
              decoration: BoxDecoration(color: bgColor),
              child: ListTile(
                leading: Image.network(data[index].getImage(), width: 50),
                title: Text(
                  '${data[index].getTitle()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text('${index + 1}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    )),
                trailing: Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$100',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add_shopping_cart_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          BlocProvider.of<ShoppingCartBloc>(context).add(
                            AddToShoppingCart(id, '${index + 1}'),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text('Added to cart'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
