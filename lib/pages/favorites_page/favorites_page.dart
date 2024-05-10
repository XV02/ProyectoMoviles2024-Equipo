import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/bloc/favorites_page/favorites_page_bloc.dart';
import 'package:proyecto_final/pages/favorites_page/favorites_app_bar.dart';
import 'package:proyecto_final/pages/favorites_page/favorites_header.dart';
import 'package:proyecto_final/pages/favorites_page/favorites_list.dart';
import 'package:proyecto_final/shared/widgets/loading_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesPageBloc, FavoritesPageState>(
        builder: (context, state) {
      if (state is FavoritesLoaded) {
        return FavoritesWidget(favorites: state.favorites);
      } else if (state is FavoriteRemoved) {
        return FavoritesWidget(favorites: state.favorites);
      } else if (state is FavoritesError) {
        // Go back to landing page
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/", (Route<dynamic> route) => false);
        });
      }
      return const LoadingPage();
    }, listener: (context, state) {
      if (state is FavoritesError) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "There was an error",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
        );
      }
      if (state is FavoriteRemoved) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Removed from favorites",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
        );
        // Refresh the page
        context.read<FavoritesPageBloc>().add(LoadFavorites());
      }
    });
  }
}

class FavoritesWidget extends StatelessWidget {
  final List favorites;
  const FavoritesWidget({
    super.key,
    required this.favorites,
  });

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
            FavoritesList(favorites: favorites),
          ],
        ),
      ),
    );
  }
}
