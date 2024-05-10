import 'package:cloud_firestore/cloud_firestore.dart';

class ShoppingCartRepository {
  final CollectionReference shoppingCartCollection =
      FirebaseFirestore.instance.collection('shopping_cart');

  // TODO: Implement methods to interact with the shopping cart collection
  Future<void> addToCart(String userId, String productId) async {
    await shoppingCartCollection.doc(userId).update(
      {
        'items': FieldValue.arrayUnion([productId]),
      },
    );
  }

  Future<void> removeFromCart(String userId, String docId) async {
    // Check if the document exists before deleting it
    final docSnapshot = await shoppingCartCollection.doc(docId).get();
    if (docSnapshot.exists) {
      // If the field quantity is greater than 1, decrement it by 1
      // If the field quantity is equal to 1, delete the document
      if (docSnapshot['quantity'] > 1) {
        await shoppingCartCollection.doc(docId).update(
          {
            'quantity': FieldValue.increment(-1),
          },
        );
      } else {
        await shoppingCartCollection.doc(docId).delete();
      }
    }
  }

  Future<List> getShoppingCart(String userId) async {
    QuerySnapshot favorites =
        await shoppingCartCollection.where("userId", isEqualTo: userId).get();
    final favoritesList = favorites.docs
        .map((e) => {
              'id': e.id,
              'mangaId': e['mangaId'],
              'volume': e['volume'],
              'date': e['date'],
              'userId': e['userId'],
              'quantity': e['quantity'],
            })
        .toList();
    return favoritesList;
  }
}
