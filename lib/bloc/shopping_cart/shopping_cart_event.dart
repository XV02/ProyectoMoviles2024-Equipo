part of 'shopping_cart_bloc.dart';

sealed class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();

  @override
  List<Object> get props => [];
}

class LoadShoppingCart extends ShoppingCartEvent {}

class AddToShoppingCart extends ShoppingCartEvent {
  final int manga_id;

  AddToShoppingCart(this.manga_id);
}

class RemoveFromShoppingCart extends ShoppingCartEvent {
  final String favorite_id;

  RemoveFromShoppingCart(this.favorite_id);
}
