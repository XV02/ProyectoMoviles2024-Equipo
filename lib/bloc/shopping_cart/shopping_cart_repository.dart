import 'package:cloud_firestore/cloud_firestore.dart';

class ShoppingCartRepository {
  final CollectionReference shoppingCartCollection =
      FirebaseFirestore.instance.collection('shopping_cart');

  Future<void> addToCart(String userId, String mangaId, String volume) async {
    final docSnapshot = await shoppingCartCollection
        .where('mangaId', isEqualTo: mangaId)
        .where('volume', isEqualTo: volume)
        .get();

    if (docSnapshot.docs.isEmpty) {
      await shoppingCartCollection.add({
        'mangaId': mangaId,
        'volume': volume,
        'date': DateTime.now(),
        'userId': userId,
        'quantity': '1',
      });
    } else {
      await shoppingCartCollection.doc(docSnapshot.docs[0].id).update(
        {
          'quantity':
              (int.parse(docSnapshot.docs[0]['quantity']) + 1).toString(),
        },
      );
    }
  }

  Future<void> removeFromCart(String userId, String docId) async {
    // Check if the document exists before deleting it
    final docSnapshot = await shoppingCartCollection.doc(docId).get();
    if (docSnapshot.exists) {
      // If the field quantity is greater than 1, decrement it by 1
      // If the field quantity is equal to 1, delete the document
      if (int.parse(docSnapshot['quantity']) > 1) {
        await shoppingCartCollection.doc(docId).update(
          {
            'quantity': (int.parse(docSnapshot['quantity']) - 1).toString(),
          },
        );
      } else {
        await shoppingCartCollection.doc(docId).delete();
      }
    }
  }

  Future<void> removeAllFromCart(String userId, String docId) async {
    await shoppingCartCollection.doc(docId).delete();
  }

  Future<List> getShoppingCart(String userId) async {
    QuerySnapshot shoppingCart =
        await shoppingCartCollection.where("userId", isEqualTo: userId).get();
    final shoppingCartList = shoppingCart.docs
        .map((e) => {
              'id': e.id,
              'mangaId': e['mangaId'],
              'volume': e['volume'],
              'date': e['date'],
              'userId': e['userId'],
              'quantity': e['quantity'],
            })
        .toList();
    return shoppingCartList;
  }
}
