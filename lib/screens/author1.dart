import 'package:flutter/material.dart';

import '../models/book.dart';
import '../widgets/listview_builder_1author.dart';

class Author1 extends StatelessWidget {
  static String routeName = '/author1';


  @override
  Widget build(BuildContext context) {
    String authorName = ModalRoute.of(context)?.settings.arguments as String; //extract argument from authors page
    return Scaffold(
      appBar: AppBar(
        title: Text(
          authorName,
          style: TextStyle(fontFamily: "Caladea", fontSize: 26),
        ),
        backgroundColor: Color(0xFFddbea9),
      ),
      body: Container(
          color: Color(0xFFfff1e6),
          padding: EdgeInsets.only(top: 10),
          child: ListViewBuilder1Author(authorName) //uses list view builder widget, passing through the authorName
      ),
    );
  }
}
