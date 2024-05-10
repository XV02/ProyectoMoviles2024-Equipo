part of 'shopping_cart_bloc.dart';

sealed class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();

  @override
  List<Object> get props => [];
}

class LoadShoppingCart extends ShoppingCartEvent {}

class AddToShoppingCart extends ShoppingCartEvent {
  final String manga_id;
  final String volume;

  AddToShoppingCart(this.manga_id, this.volume);
}

class RemoveFromShoppingCart extends ShoppingCartEvent {
  final String shoppingCart_id;

  RemoveFromShoppingCart(this.shoppingCart_id);
}

class RemoveAllFromShoppingCart extends ShoppingCartEvent {
  final String shoppingCart_id;

  RemoveAllFromShoppingCart(this.shoppingCart_id);
}
