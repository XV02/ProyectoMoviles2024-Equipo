import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/bloc/favorites_page/favorites_page_bloc.dart';
import 'package:proyecto_final/bloc/shopping_cart/shopping_cart_bloc.dart';
import 'package:proyecto_final/data_models/manga_data.dart';
import 'package:proyecto_final/pages/individual_item/manga_item_appbar.dart';

class MangaItemArguments {
  final String id;

  MangaItemArguments(this.id);
}

class MangaItem extends StatefulWidget {
  const MangaItem({Key? key}) : super(key: key);

  @override
  State<MangaItem> createState() => _manga_item();
}

class _manga_item extends State<MangaItem> {
  var data = null;
  String id = '';
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () => getD());
  }

  Future<void> getD() async {
    final MangaItemArguments args =
        ModalRoute.of(context)!.settings.arguments as MangaItemArguments;
    MangaModel toAdd = MangaModel();

    this.id = args.id;

    data = await toAdd.getDataById(args.id, '3');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MangaItemAppBar(),
        body: data == null
            ? const Center(child: CircularProgressIndicator())
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 40.0),
                        width: 500,
                        height: 140,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: Text(
                            '${data.getTitle()}',
                            style: TextStyle(
                                decorationColor: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Image.network(
                      data.getImage(),
                      width: 300,
                      height: 350,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        '#3',
                        style: TextStyle(
                            decorationColor: Colors.white, fontSize: 35),
                      ),
                    ),
                    // A Row with two buttons to add to cart and favorites
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            print(id);
                            // Add to cart
                            BlocProvider.of<ShoppingCartBloc>(context)
                                .add(AddToShoppingCart(id, '3'));
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Added to shopping cart",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                              );
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.shopping_cart),
                              Text('Add to Cart'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              // Add to favorites
                              BlocProvider.of<FavoritesPageBloc>(context)
                                  .add(AddFavorites(id, '3'));
                            },
                            child: BlocConsumer<FavoritesPageBloc,
                                FavoritesPageState>(
                              builder: (context, state) {
                                if (state is FavoriteAddedSign) {
                                  return const Icon(Icons.favorite);
                                }
                                if (state is FavoriteUnAddedSign) {
                                  return const Icon(Icons.favorite_border);
                                }
                                return const Icon(Icons.favorite_border);
                              },
                              listener: (context, state) {
                                if (state is FavoritesError) {
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "There was an error",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.black,
                                      ),
                                    );
                                } else if (state is FavoriteAddedSign) {
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Added to favorites",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.black,
                                      ),
                                    );
                                } else if (state is FavoriteUnAddedSign) {
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Removed from favorites",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.black,
                                      ),
                                    );
                                }
                              },
                            )),
                      ],
                    ),
                  ],
                ),
              ));
  }
}
