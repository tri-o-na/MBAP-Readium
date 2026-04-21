import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readium_v1/screens/about_book_screen.dart';

import '../models/book.dart';
import '../providers/book_list.dart';
import '../screens/author1.dart';
import '../services/firestore_books_service.dart';
import 'listview_builder_1author.dart';

class ListViewBuilder2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // BookList myBookList = Provider.of(context);
    // List<Book> myBooks = myBookList.getMyBooks();
    //get all books from book list
    FirestoreService fsService = FirestoreService();

    var seen = Set<String>();

    //uniquelist filters the orginial list to only show the different authors available

    return StreamBuilder<List<Book>>(
      stream: fsService.getMyBooks(),
      builder: (context, snapshot) {
        List<Book> uniquelist = snapshot.data!.where((book) => seen.add(book.authorName)).toList();
        return ListView.builder(
          itemCount: uniquelist.length,
          itemBuilder: (context, index) {
            Book book = uniquelist[index];
            return Card(
              color: Color(0xffF9EADF),
              margin: const EdgeInsets.fromLTRB(10, 0, 8, 7),
              child: ListTile(
                minLeadingWidth: 0,
                leading: Icon(Icons.person, color: Color(0xffa5a58d)),
                title: Text(book.authorName, style: TextStyle(color: Color(0xffcb997e),
                    fontFamily: "Lucida Bright", fontSize: 18),),
                onTap: () {
                  Navigator.of(context).pushNamed(Author1.routeName, arguments: book.authorName);
                  //navigate the use to author1 with the authorName as the argument
                },
              ),
            );
          },
        );
      }
    );
  }
}
