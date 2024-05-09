import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc() : super(ShoppingCartInitial()) {
    on<LoadCart>(_loadCart);
    on<AddToCart>(_addToCart);
    on<RemoveFromCart>(_removeFromCart);
  }

  FutureOr<void> _loadCart(event, emit) {
    // Aquí puedes cargar los productos del carrito desde el repositorio
  }

  FutureOr<void> _addToCart(event, emit) async {
    // Aquí puedes agregar un producto al carrito
  }

  FutureOr<void> _removeFromCart(event, emit) async {
    // Aquí puedes eliminar un producto del carrito
  }
}
