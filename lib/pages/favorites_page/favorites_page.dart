import 'package:flutter/material.dart';
import 'package:proyecto_final/pages/favorites_page/favorites_app_bar.dart';
import 'package:proyecto_final/pages/favorites_page/favorites_header.dart';
import 'package:proyecto_final/pages/favorites_page/favorites_list.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FavoritesAppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FavoritesHeader(),
            FavoritesList(),
          ],
        ),
      ),
    );
  }
}
