import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  // String email;
  String id;
  String imageUrl;
  String bookName;
  String authorName;
  String seriesName;
  int seriesNo;
  String language;
  DateTime dateTimeAdded;
  int favourite;
  int toBeRead;
  int haveRead;
  int trash;
  String description;


  Book ({required this.id, required this.imageUrl, required this.bookName, required this.authorName,
    required this.seriesName, required this.seriesNo, required this.language,
    required this.dateTimeAdded, required this.favourite, required this.toBeRead,
    required this.haveRead, required this.trash, required this.description});

   Book.fromMap(Map <String, dynamic> snapshot,String id) :
        id = id,
        // email = snapshot['email'] ?? '',
        imageUrl = snapshot['imageUrl'] ?? '',
        bookName = snapshot['bookName'] ?? '',
        authorName = snapshot['authorName'] ?? '',
        seriesName = snapshot['seriesName'] ?? '',
        seriesNo = snapshot['seriesNo'] ?? 0,
        language = snapshot['language'] ?? '',
        dateTimeAdded = (snapshot['dateTimeAdded'] ?? Timestamp.now() as Timestamp).toDate(),
        favourite = snapshot['favourite'] ?? 0,
        toBeRead = snapshot['toBeRead'] ?? 0,
        haveRead = snapshot['haveRead'] ?? 0,
        trash = snapshot['trash'] ?? 0,
        description = snapshot['description'] ?? '';
}
