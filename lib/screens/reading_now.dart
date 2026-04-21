import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readium_v1/providers/book_list.dart';
import 'package:readium_v1/widgets/search_page.dart';
import 'package:readium_v1/widgets/app_drawer.dart';
import 'package:readium_v1/widgets/listview_builder.dart';

import '../models/book.dart';

class ReadingNow extends StatelessWidget {
  static String routeName = '/readingnow';




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reading Now',
          style: TextStyle(fontFamily: "Caladea", fontSize: 26),
        ),
        backgroundColor: Color(0xFFddbea9),
        actions: [
          IconButton(onPressed: () {
            showSearch(context: context, delegate: CustomSearchDelegate(),);
          },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Container(
        color: Color(0xFFfff1e6),
        padding: EdgeInsets.only(top: 10),
        child: ListViewBuilder() //uses list view builder widget
        ),
        drawer: AppDrawer(), //navigate between pages via app drawer
    );
  }
}