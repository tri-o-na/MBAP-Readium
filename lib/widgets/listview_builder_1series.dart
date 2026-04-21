import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readium_v1/screens/about_book_screen.dart';
import 'package:readium_v1/services/firestore_books_service.dart';

import '../models/book.dart';
import '../providers/book_list.dart';
import '../screens/edit_book_details.dart';

class ListViewBuilder1Series extends StatefulWidget {
  String seriesName;

  ListViewBuilder1Series(this.seriesName);

  @override
  State<ListViewBuilder1Series> createState() => _ListViewBuilder1SeriesState();
}

class _ListViewBuilder1SeriesState extends State<ListViewBuilder1Series> {
  @override
  Widget build(BuildContext context) {

    // BookList myBookList = Provider.of(context);
    // List<Book> myBooks = myBookList.getMyBooks();
    FirestoreService fsService = FirestoreService();


    return StreamBuilder<List<Book>>(
      stream: fsService.getMyBooks(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            Book book = snapshot.data![index];
            return  book.seriesName == widget.seriesName? book.trash == 0?Card(
              //will filter those that have the same series name as the one selected at series page and not in trash
              color: Color(0xffF9EADF),
              margin: const EdgeInsets.fromLTRB(10, 0, 8, 7),
              child: ListTile(
                minLeadingWidth: 0,
                leading: Image.network(book.imageUrl), //
                title: Text(book.bookName, style: TextStyle(color: Color(0xffcb997e),
                    fontFamily: "Lucida Bright", fontSize: 18, fontWeight: FontWeight.bold),),
                subtitle: Text(book.authorName, style: TextStyle(color: Color(0xffb7b7a4),
                    fontFamily: "Caladea", fontSize: 15),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutBook(book)));
                },

                trailing: PopUpMenu(
                  menuList: [
                    PopupMenuItem(
                      child: ListTile(
                        leading: Icon((book.favourite == 1) ? Icons.star: Icons.star_border,
                          //when the value of favourite is 1, it will show the 1st icon, if  not, it will show the 2nd icon
                          color: Color(0xffa5a58d),),
                        title: Text('Favourite', style: TextStyle(color: Color(0xffcb997e),
                            fontFamily: "Caladea", fontSize: 20),),
                        minLeadingWidth: 30,
                        onTap: () {setState(() {
                          if (book.favourite == 0){
                            book.favourite = 1;
                          }
                          else {book.favourite = 0;}
                        });},
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: Icon((book.toBeRead == 1) ? Icons.access_time_filled: Icons.access_time,
                          //when the value of to be read is 1, it will show the 1st icon, if  not, it will show the 2nd icon
                          color: Color(0xffa5a58d),),
                        title: Text('To Be Read', style: TextStyle(color: Color(0xffcb997e),
                            fontFamily: "Caladea", fontSize: 20),),
                        minLeadingWidth: 30,
                        onTap: () {setState(() {
                          if (book.toBeRead == 0){
                            book.toBeRead = 1;
                          }
                          else {book.toBeRead = 0;}
                        });},
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: Icon((book.haveRead == 1) ? Icons.done_all: Icons.done,
                          //when the value of have read is 1, it will show the 1st icon, if  not, it will show the 2nd icon
                          color: Color(0xffa5a58d),),
                        title: Text('Have Read', style: TextStyle(color: Color(0xffcb997e),
                            fontFamily: "Caladea", fontSize: 20),),
                        minLeadingWidth: 30,
                        onTap: () {setState(() {
                          if (book.haveRead == 0){
                            book.haveRead = 1;
                          }
                          else {book.haveRead = 0;}
                        });},
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: Icon((book.trash == 1) ? Icons.delete: Icons.delete_outline_outlined,
                          //when the value of trash is 1, it will show the 1st icon, if  not, it will show the 2nd icon
                          color: Color(0xffa5a58d),),
                        title: Text('Delete', style: TextStyle(color: Color(0xffcb997e),
                            fontFamily: "Caladea", fontSize: 20),),
                        minLeadingWidth: 30,
                        onTap: () {setState(() {
                          if (book.trash == 0){
                            book.trash = 1;
                          }
                          else {book.trash = 0;}
                        });},
                      ),
                    ),
                  ],
                  icon: Icon(Icons.more_vert, color: Color(0xffa5a58d),),
                ),
              ),
            ): Center(): Center();
          },

        );
      }
    );
  }
}
class PopUpMenu extends StatelessWidget { //popup menu widget

  final List<PopupMenuEntry> menuList;
  final Widget? icon;

  const PopUpMenu({Key? key, required this.menuList, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      itemBuilder: ((context) => menuList),
      icon: icon,
      color: Color(0xffFFF1E6),
    );
  }
}