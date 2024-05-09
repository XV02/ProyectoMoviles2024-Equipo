import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_final/bloc/shopping_cart_repository.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  final ShoppingCartRepository _shoppingCartRepo = ShoppingCartRepository();
  final User user = FirebaseAuth.instance.currentUser!;

  ShoppingCartBloc() : super(ShoppingCartInitial()) {
    on<LoadCart>(_loadCart);
    on<AddToCart>(_addToCart);
    on<RemoveFromCart>(_removeFromCart);
  }

  FutureOr<void> _loadCart(event, emit) async {
    try {
      await _shoppingCartRepo.getFavorites(user.uid, event.manga_id);
    } catch (e) {
      emit(ShoppingCartError());
    }
  }

  FutureOr<void> _addToCart(event, emit) async {
    try {
      await _shoppingCartRepo.addToCart(user.uid, event.manga_id);
    } catch (e) {
      emit(ShoppingCartError());
    }
  }

  FutureOr<void> _removeFromCart(event, emit) async {
    try {
      await _shoppingCartRepo.removeFromCart(user.uid, event.manga_id);
    } catch (e) {
      emit(ShoppingCartError());
    }
  }
}
