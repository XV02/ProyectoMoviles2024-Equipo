import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorites_page_event.dart';
part 'favorites_page_state.dart';

class FavoritesPageBloc extends Bloc<FavoritesPageEvent, FavoritesPageState> {
  FavoritesPageBloc() : super(FavoritesPageInitial()) {
    on<LoadFavorites>(_loadFavorites);
    on<AddFavorites>(_addFavorites);
    on<RemoveFavorites>(_removeFavorites);
  }

  FutureOr<void> _loadFavorites(event, emit) {
    // Aquí puedes cargar los productos del carrito desde el repositorio
  }

  FutureOr<void> _addFavorites(event, emit) async {
    // Aquí puedes agregar un producto al carrito
  }

  FutureOr<void> _removeFavorites(event, emit) async {
    // Aquí puedes eliminar un producto del carrito
  }
}
