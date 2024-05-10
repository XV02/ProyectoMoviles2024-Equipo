import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/bloc/favorites_page/favorites_page_bloc.dart';

class FavoritesList extends StatelessWidget {
  final List favorites;

  const FavoritesList({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .45,
      width: double.infinity,
      child: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (BuildContext context, int index) {
          Color bgColor =
              index % 2 != 0 ? Colors.red : Color.fromARGB(255, 243, 52, 38);
          return Container(
            height: 85,
            width: double.infinity,
            decoration: BoxDecoration(color: bgColor),
            child: ListTile(
              leading: favorites[index]['image'] != null
                  ? Image.network(
                      favorites[index]['image'],
                      height: 64,
                      width: 64,
                    )
                  : Icon(
                      Icons.image,
                      color: Colors.white,
                      size: 64,
                    ),
              title: Text(
                '${favorites[index]['title']}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              trailing: Container(
                margin: EdgeInsets.only(right: 20),
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${favorites[index]['volume']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.white,
                      onPressed: () {
                        // Remove from favorites with the event
                        BlocProvider.of<FavoritesPageBloc>(context).add(
                          RemoveFavorites(favorites[index]['id']),
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
