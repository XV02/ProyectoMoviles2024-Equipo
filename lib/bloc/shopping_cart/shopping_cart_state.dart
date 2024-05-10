part of 'shopping_cart_bloc.dart';

sealed class ShoppingCartState extends Equatable {
  const ShoppingCartState();

  @override
  List<Object> get props => [];
}

final class ShoppingCartInitial extends ShoppingCartState {}

class ShoppingCartLoaded extends ShoppingCartState {
  final List shoppingCart;

  ShoppingCartLoaded(this.shoppingCart);
}

class ShoppingCartAdded extends ShoppingCartState {}

class ShoppingCartRemoved extends ShoppingCartState {
  final List shoppingCart;

  ShoppingCartRemoved(this.shoppingCart);
}

class ShoppingCartError extends ShoppingCartState {}
