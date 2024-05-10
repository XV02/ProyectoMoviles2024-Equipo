import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_final/bloc/favorites_page/favorites_page_repository.dart';
import 'package:proyecto_final/data_models/manga_data.dart';

part 'favorites_page_event.dart';
part 'favorites_page_state.dart';

class FavoritesPageBloc extends Bloc<FavoritesPageEvent, FavoritesPageState> {
  final FavoritesRepository _favoritesRepo = FavoritesRepository();

  FavoritesPageBloc() : super(FavoritesPageInitial()) {
    on<LoadFavorites>(_loadFavorites);
    on<AddFavorites>(_addFavorites);
    on<RemoveFavorites>(_removeFavorites);
  }

  FutureOr<void> _loadFavorites(event, emit) async {
    try {
      final String userId = FirebaseAuth.instance.currentUser!.uid;
      List favorites = await _favoritesRepo.getFavorites(userId);
      // Create a list of favorites where you use a for loop to iterate over the list of favorites and get the data of each favorite
      List favoritesList = [];
      for (var favorite in favorites) {
        MangaModel favoriteData = await MangaModel()
            .getDataById(favorite['mangaId'], favorite['volume']);
        favoritesList.add({
          'id': favorite['id'],
          'mangaId': favorite['mangaId'],
          'title': favoriteData.getTitle(),
          'image': favoriteData.getImage(),
          'dateAdded': favorite['date'],
          'volume': favorite['volume'],
        });
      }
      emit(FavoritesLoaded(favoritesList));
    } catch (e) {
      emit(FavoritesError());
    }
  }

  FutureOr<void> _addFavorites(event, emit) async {
    try {
      final String userId = FirebaseAuth.instance.currentUser!.uid;
      bool added = await _favoritesRepo.addFavorite(
          userId, event.manga_id, event.volume);
      if (added) {
        emit(FavoriteAddedSign());
      } else {
        emit(FavoriteUnAddedSign());
      }
    } catch (e) {
      emit(FavoritesError());
    }
  }

  FutureOr<void> _removeFavorites(event, emit) async {
    try {
      final String userId = FirebaseAuth.instance.currentUser!.uid;
      await _favoritesRepo.removeFavorite(userId, event.favorite_id);
      // Update the list of favorites after removing a favorite
      List favorites = await _favoritesRepo.getFavorites(userId);
      // Create a list of favorites where you use a for loop to iterate over the list of favorites and get the data of each favorite
      List favoritesList = [];
      for (var favorite in favorites) {
        MangaModel favoriteData = await MangaModel()
            .getDataById(favorite['mangaId'], favorite['volume']);
        favoritesList.add({
          'id': favorite['id'],
          'mangaId': favorite['mangaId'],
          'title': favoriteData.getTitle(),
          'image': favoriteData.getImage(),
          'dateAdded': favorite['date'],
          'volume': favorite['volume'],
        });
      }
      emit(FavoriteRemoved(favoritesList));
    } catch (e) {
      emit(FavoritesError());
    }
  }
}
