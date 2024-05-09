import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShoppingCartRepository {
  final CollectionReference shoppingCartCollection =
      FirebaseFirestore.instance.collection('shopping_cart');

  Future<void> createUserCartDocument(User user) async {
    final docSnapshot = await shoppingCartCollection.doc(user.uid).get();
    // Verificion que no exista ningun documento con el userid
    if (!docSnapshot.exists) {
      await shoppingCartCollection.doc(user.uid).set(
        {
          'items': [],
        },
      );
    }
  }

  Future<void> addToCart(String userId, String productId) async {
    await shoppingCartCollection.doc(userId).update({
      'items': FieldValue.arrayUnion([productId]),
    });
  }

  Future<void> removeFromCart(String userId, String productId) async {
    await shoppingCartCollection.doc(userId).update({
      'items': FieldValue.arrayRemove([productId]),
    });
  }

  Future<void> getFavorites(String userId, String productId) async {
    await shoppingCartCollection.doc(userId).get();
  }
}
