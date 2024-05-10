part of 'favorites_page_bloc.dart';

sealed class FavoritesPageState extends Equatable {
  const FavoritesPageState();

  @override
  List<Object> get props => [];
}

final class FavoritesPageInitial extends FavoritesPageState {}

class FavoritesLoaded extends FavoritesPageState {
  final List favorites;

  FavoritesLoaded(this.favorites);
}

class FavoriteAdded extends FavoritesPageState {}

class FavoriteRemoved extends FavoritesPageState {
  final List favorites;

  FavoriteRemoved(this.favorites);
}

class FavoritesError extends FavoritesPageState {}

class FavoriteAddedSign extends FavoritesPageState {}

class FavoriteUnAddedSign extends FavoritesPageState {}
