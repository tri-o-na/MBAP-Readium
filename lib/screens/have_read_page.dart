import 'package:flutter/material.dart';
import 'package:readium_v1/widgets/listview_builder_haveRead.dart';
import 'package:readium_v1/widgets/search_page.dart';
import 'package:readium_v1/widgets/app_drawer.dart';

import '../models/book.dart';
import '../widgets/listview_builder.dart';

class HaveReadPage extends StatelessWidget {
  static String routeName = '/haveread';




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Have Read', style: TextStyle(fontFamily: "Caladea", fontSize: 26),),
          backgroundColor: Color(0xFFddbea9),
          actions: [
            IconButton(onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate(),);
            },
                icon: const Icon(Icons.search))
          ],
        ),
        body: Container(
          color: Color(0xFFFFF1E6),
          padding: EdgeInsets.only(top: 10),
          child: ListViewBuilderHaveRead() //uses list view builder widget
        ),
        drawer: AppDrawer() //navigate between pages via app drawer
    );
  }
}