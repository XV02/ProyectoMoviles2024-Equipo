import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_final/bloc/shopping_cart/shopping_cart_repository.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  final ShoppingCartRepository _shoppingCartRepo = ShoppingCartRepository();

  ShoppingCartBloc() : super(ShoppingCartInitial()) {
    on<LoadShoppingCart>(_loadShoppingCart);
    on<AddToShoppingCart>(_addToShoppingCart);
    on<RemoveFromShoppingCart>(_removeFromShoppingCart);
  }

  Future<void> _loadShoppingCart(
    LoadShoppingCart event,
    Emitter<ShoppingCartState> emit,
  ) async {
    try {
      // Load the shopping cart from the database
      final String userId = FirebaseAuth.instance.currentUser!.uid;
      List shoppingCart = await _shoppingCartRepo.getShoppingCart(userId);
      List shoppingCartList = [];
      for (var item in shoppingCart) {
        shoppingCartList.add({
          'id': item['id'],
          'mangaId': item['mangaId'],
          'title': item['title'],
          'image': item['image'],
          'quantity': item['quantity'],
        });
      }
      emit(ShoppingCartLoaded(shoppingCartList));
    } catch (e) {
      emit(ShoppingCartError());
    }
  }

  Future<void> _addToShoppingCart(
    AddToShoppingCart event,
    Emitter<ShoppingCartState> emit,
  ) async {
    try {
      final User user = FirebaseAuth.instance.currentUser!;
      await _shoppingCartRepo.addToCart(user.uid, '');
      emit(ShoppingCartAdded());
    } catch (e) {
      emit(ShoppingCartError());
    }
  }

  Future<void> _removeFromShoppingCart(
    RemoveFromShoppingCart event,
    Emitter<ShoppingCartState> emit,
  ) async {
    try {
      final String userId = FirebaseAuth.instance.currentUser!.uid;
      await _shoppingCartRepo.removeFromCart(userId, event.favorite_id);
      List shoppingCart = await _shoppingCartRepo.getShoppingCart(userId);
      List shoppingCartList = [];
      for (var item in shoppingCart) {
        shoppingCartList.add({
          'id': item['id'],
          'mangaId': item['mangaId'],
          'title': item['title'],
          'image': item['image'],
          'quantity': item['quantity'],
        });
      }
      emit(ShoppingCartRemoved(shoppingCartList));
    } catch (e) {
      emit(ShoppingCartError());
    }
  }
}
