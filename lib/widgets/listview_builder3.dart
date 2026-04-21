import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readium_v1/screens/about_book_screen.dart';
import 'package:readium_v1/services/firestore_books_service.dart';

import '../models/book.dart';
import '../providers/book_list.dart';
import '../screens/series1.dart';

class ListViewBuilder3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // BookList myBookList = Provider.of(context);
    // List<Book> myBooks = myBookList.getMyBooks();
    FirestoreService fsService = FirestoreService();
    //get all books from book list

    var seen = Set<String>();
    //uniquelist2 filters the orginial list to only show the different series available
    return StreamBuilder<List<Book>>(
      stream: fsService.getMyBooks(),
      builder: (context, snapshot) {
        List<Book> uniquelist2 = snapshot.data!.where((book) => seen.add(book.seriesName)).toList();
        return ListView.builder(
          itemCount: uniquelist2.length,
          itemBuilder: (context, index) {
            Book book = uniquelist2[index];
            return Card(
              color: Color(0xffF9EADF),
              margin: const EdgeInsets.fromLTRB(10, 0, 8, 7),
              child: ListTile(
                minLeadingWidth: 0,
                leading: Icon(Icons.discount, color: Color(0xffa5a58d)),
                title: Text(book.seriesName, style: TextStyle(color: Color(0xffcb997e),
                    fontFamily: "Lucida Bright", fontSize: 18),),
                onTap: () {
                  Navigator.of(context).pushNamed(Series1.routeName, arguments: book.seriesName);
                  //navigate the use to series1 with the seriesName as the argument
                },
              ),
            );
          },
        );
      }
    );
  }
}
