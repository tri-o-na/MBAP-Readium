import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readium_v1/services/firestore_books_service.dart';

import '../models/book.dart';
import '../providers/book_list.dart';
import '../screens/about_book_screen.dart';
//
// class SearchPage extends StatefulWidget {
//
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:Color(0xffF9EADF),
//       appBar: AppBar(
//         title: Text(
//           'Search',
//           style: TextStyle(fontFamily: "Caladea", fontSize: 26),
//         ),
//         backgroundColor: Color(0xFFddbea9),
//         // actions: [
//         //   IconButton(onPressed: () {
//         //     showSearch(context: context, delegate: CustomSearchDelegate(myBooks),);
//         //   },
//         //       icon: const Icon(Icons.search))
//         // ],
//       ),
//       body: Container(),
//     );
//   }
// }

class CustomSearchDelegate extends SearchDelegate {



  //
  // List<String> searchTerms = [
  //   'Red Queen',
  //   'Glass Sword',
  //   'Kings Cage',
  //   'War Storm',
  //   'Broken Throne',
  // ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: () {
        query = '';
      },
          icon: const Icon(Icons.clear))
      //clears the search input
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return
      IconButton(onPressed: () {
        close(context, null);
      },
          icon: const Icon(Icons.arrow_back));
    //goes back to previous page
  }

  @override
  Widget buildResults(BuildContext context) {
    // BookList myBookList = Provider.of(context);
    // List<Book> myBooks = myBookList.getMyBooks();
    FirestoreService fsService = FirestoreService();
    // TODO: implement buildResults
    List<Book> matchQuery = [];


    print(matchQuery.length);

    return StreamBuilder<List<Book>>(
        stream: fsService.getMyBooks(),
        builder: (context, snapshot) {
          for (var book in snapshot.data!) {
            if (book.bookName.toLowerCase().contains(query.toLowerCase())) {
              matchQuery.add(book);
              print(query.toLowerCase() + "..." + book.bookName);
            }
          }
          return ListView.builder(
            itemCount: matchQuery.length, //list of book names
            itemBuilder: (context, index) {
              Book book = matchQuery[index];
              //var result = matchQuery[index];
              return Card(
                color: Color(0xffF9EADF),
                child: ListTile(
                  title: Text(book.bookName, style: TextStyle(color: Color(0xffcb997e),
                    fontFamily: "Caladea", fontSize: 21,)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutBook(book))); //opens up  to each book after you have searched
                  },
                ),
              );
            },
          );
        }
    );
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    // BookList myBookList = Provider.of(context);
    // List<Book> myBooks = myBookList.getMyBooks();
    FirestoreService fsService = FirestoreService();
    // TODO: implement buildResults
    List<Book> matchQuery = [];


    print(matchQuery.length);

    return StreamBuilder<List<Book>>(
      stream: fsService.getMyBooks(),
      builder: (context, snapshot) {
        for (var book in snapshot.data!) {
          if (book.bookName.toLowerCase().contains(query.toLowerCase())) {
            matchQuery.add(book);
            print(query.toLowerCase() + "..." + book.bookName);
          }
        }
        return ListView.builder(
          itemCount: matchQuery.length, //list of book names
          itemBuilder: (context, index) {
            Book book = matchQuery[index];
            //var result = matchQuery[index];
            return Card(
              color: Color(0xffF9EADF),
              child: ListTile(
                title: Text(book.bookName, style: TextStyle(color: Color(0xffcb997e),
                  fontFamily: "Caladea", fontSize: 21,)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutBook(book))); //opens up  to each book after you have searched
                },
              ),
            );
          },
        );
      }
    );
  }

}
