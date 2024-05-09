part of 'favorites_page_bloc.dart';

sealed class FavoritesPageState extends Equatable {
  const FavoritesPageState();

  @override
  List<Object> get props => [];
}

final class FavoritesPageInitial extends FavoritesPageState {}

class FavoritesLoaded extends FavoritesPageState {}

class FavoriteAdded extends FavoritesPageState {}

class FavoriteRemoved extends FavoritesPageState {}

class FavoritesError extends FavoritesPageState {}
