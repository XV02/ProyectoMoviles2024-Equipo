part of 'favorites_page_bloc.dart';

sealed class FavoritesPageEvent extends Equatable {
  const FavoritesPageEvent();

  @override
  List<Object> get props => [];
}

class LoadFavorites extends FavoritesPageEvent {}

class AddFavorites extends FavoritesPageEvent {
  final int manga_id;

  AddFavorites(this.manga_id);
}

class RemoveFavorites extends FavoritesPageEvent {
  final String favorite_id;

  RemoveFavorites(this.favorite_id);
}
