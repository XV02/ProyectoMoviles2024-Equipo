import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_final/bloc/favorites_page_repository.dart';

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
      final User user = FirebaseAuth.instance.currentUser!;
      await _favoritesRepo.getFavorites(user.uid, event.manga_id);
    } catch (e) {
      emit(FavoritesError());
    }
  }

  FutureOr<void> _addFavorites(event, emit) async {
    try {
      final User user = FirebaseAuth.instance.currentUser!;
      await _favoritesRepo.addFavorite(user.uid, event.manga_id);
    } catch (e) {
      emit(FavoritesError());
    }
  }

  FutureOr<void> _removeFavorites(event, emit) async {
    try {
      final User user = FirebaseAuth.instance.currentUser!;
      await _favoritesRepo.removeFavorite(user.uid, event.manga_id);
    } catch (e) {
      emit(FavoritesError());
    }
  }
}
