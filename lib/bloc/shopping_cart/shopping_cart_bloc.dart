import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_final/bloc/shopping_cart/shopping_cart_repository.dart';
import 'package:proyecto_final/data_models/manga_data.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  final ShoppingCartRepository _shoppingCartRepo = ShoppingCartRepository();

  ShoppingCartBloc() : super(ShoppingCartInitial()) {
    on<LoadShoppingCart>(_loadShoppingCart);
    on<AddToShoppingCart>(_addToShoppingCart);
    on<RemoveFromShoppingCart>(_removeFromShoppingCart);
    on<RemoveAllFromShoppingCart>(_removeAllFromShoppingCart);
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
        MangaModel mangaData =
            await MangaModel().getDataById(item['mangaId'], item['volume']);
        shoppingCartList.add({
          'id': item['id'],
          'mangaId': item['mangaId'],
          'title': mangaData.getTitle(),
          'image': mangaData.getImage(),
          'quantity': item['quantity'],
          'volume': item['volume'],
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
      final String user = FirebaseAuth.instance.currentUser!.uid;
      await _shoppingCartRepo.addToCart(user, event.manga_id, event.volume);
      List shoppingCart = await _shoppingCartRepo.getShoppingCart(user);
      List shoppingCartList = [];
      for (var item in shoppingCart) {
        MangaModel mangaData =
            await MangaModel().getDataById(item['mangaId'], item['volume']);
        shoppingCartList.add({
          'id': item['id'],
          'mangaId': item['mangaId'],
          'title': mangaData.getTitle(),
          'image': mangaData.getImage(),
          'quantity': item['quantity'],
          'volume': item['volume'],
        });
      }
      emit(ShoppingCartAdded(shoppingCartList));
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
      await _shoppingCartRepo.removeFromCart(userId, event.shoppingCart_id);
      List shoppingCart = await _shoppingCartRepo.getShoppingCart(userId);
      List shoppingCartList = [];
      for (var item in shoppingCart) {
        MangaModel mangaData =
            await MangaModel().getDataById(item['mangaId'], item['volume']);
        shoppingCartList.add({
          'id': item['id'],
          'mangaId': item['mangaId'],
          'title': mangaData.getTitle(),
          'image': mangaData.getImage(),
          'quantity': item['quantity'],
          'volume': item['volume'],
        });
      }
      emit(ShoppingCartRemoved(shoppingCartList));
    } catch (e) {
      emit(ShoppingCartError());
    }
  }

  Future<void> _removeAllFromShoppingCart(
    RemoveAllFromShoppingCart event,
    Emitter<ShoppingCartState> emit,
  ) async {
    try {
      final String userId = FirebaseAuth.instance.currentUser!.uid;
      await _shoppingCartRepo.removeAllFromCart(userId, event.shoppingCart_id);
      List shoppingCart = await _shoppingCartRepo.getShoppingCart(userId);
      List shoppingCartList = [];
      for (var item in shoppingCart) {
        MangaModel mangaData =
            await MangaModel().getDataById(item['mangaId'], item['volume']);
        shoppingCartList.add({
          'id': item['id'],
          'mangaId': item['mangaId'],
          'title': mangaData.getTitle(),
          'image': mangaData.getImage(),
          'quantity': item['quantity'],
          'volume': item['volume'],
        });
      }
      emit(ShoppingCartRemoved(shoppingCartList));
    } catch (e) {
      emit(ShoppingCartError());
    }
  }
}
