import 'package:flutter/material.dart';

class ShoppingCartList extends StatelessWidget {
  final List<String> volumes;
  final String author;
  final String price;

  const ShoppingCartList({
    super.key,
    this.volumes = const [
      'One Piece #14',
      'One Piece #57',
      'One Piece #61',
      'One Piece #121',
      'One Piece #189',
    ],
    this.author = 'Eiichiro Oda',
    this.price = '100',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .345,
      width: double.infinity,
      child: ListView.builder(
        itemCount: volumes.length,
        itemBuilder: (BuildContext context, int index) {
          Color bgColor =
              index % 2 != 0 ? Colors.red : Color.fromARGB(255, 243, 52, 38);
          return Container(
            height: 85,
            width: double.infinity,
            decoration: BoxDecoration(color: bgColor),
            child: ListTile(
              title: Text(
                '${volumes[index]}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              subtitle: Text('${author}',
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
                      '\$${price}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Icon(
                      Icons.delete_outline_outlined,
                      color: Colors.white,
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
