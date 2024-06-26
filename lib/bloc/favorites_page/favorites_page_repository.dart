import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritesRepository {
  final CollectionReference favoritesCollection =
      FirebaseFirestore.instance.collection('favorites');

  Future<void> createUserFavoritesDocument(User user) async {
    final docSnapshot = await favoritesCollection.doc(user.uid).get();
    if (!docSnapshot.exists) {
      await favoritesCollection.doc(user.uid).set(
        {
          'items':
              [], // Puedes inicializar la lista de favoritos con una lista vacía de elementos
        },
      );
    }
  }

  Future<bool> addFavorite(String userId, String mangaId, String volume) async {
    // Check if the favorite already exists
    final docSnapshot = await favoritesCollection.doc(userId).get();
    if (docSnapshot.exists) {
      // If exists, delete the document
      await favoritesCollection.doc(userId).delete();
      return false;
    } else {
      // If it doesn't exist, add the favorite
      await favoritesCollection.doc(userId).set({
        'mangaId': mangaId,
        'volume': volume,
        'date': DateTime.now(),
        'userId': userId,
      });
      return true;
    }
  }

  Future<void> removeFavorite(String userId, String docId) async {
    await favoritesCollection.doc(docId).delete();
  }

  Future<List> getFavorites(String userId) async {
    QuerySnapshot favorites =
        await favoritesCollection.where("userId", isEqualTo: userId).get();
    final favoritesList = favorites.docs
        .map((e) => {
              'id': e.id,
              'mangaId': e['mangaId'],
              'volume': e['volume'],
              'date': e['date'],
              'userId': e['userId'],
            })
        .toList();
    return favoritesList;
  }
}
