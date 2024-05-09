part of 'shopping_cart_bloc.dart';

sealed class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends ShoppingCartEvent {}

class AddToCart extends ShoppingCartEvent {
  final int mangaID;

  AddToCart(this.mangaID);
}

class RemoveFromCart extends ShoppingCartEvent {
  final int mangaID;

  RemoveFromCart(this.mangaID);
}
