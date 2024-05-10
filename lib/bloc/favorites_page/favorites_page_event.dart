part of 'favorites_page_bloc.dart';

sealed class FavoritesPageEvent extends Equatable {
  const FavoritesPageEvent();

  @override
  List<Object> get props => [];
}

class LoadFavorites extends FavoritesPageEvent {}

class AddFavorites extends FavoritesPageEvent {
  final String manga_id;
  final String volume;

  AddFavorites(this.manga_id, this.volume);
}

class RemoveFavorites extends FavoritesPageEvent {
  final String favorite_id;

  RemoveFavorites(this.favorite_id);
}
