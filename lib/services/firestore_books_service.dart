
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:readium_v1/models/book.dart';

import 'auth_service.dart';

class FirestoreService{
  // AuthService authService = AuthService();
  // removeBook(id) {
  //   return FirebaseFirestore.instance
  //       .collection('books')
  //       .doc(id)
  //       .delete();
  // }
  Stream<List<Book>> getMyBooks() {
    return FirebaseFirestore.instance
        .collection('books')
        // .where('email', isEqualTo: authService.getCurrentUser()!.email)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map<Book>((doc) => Book.fromMap(doc.data(), doc.id))
        .toList());
  }

}