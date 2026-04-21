import 'package:flutter/material.dart';
import 'package:readium_v1/widgets/search_page.dart';
import 'package:readium_v1/widgets/app_drawer.dart';

import '../models/book.dart';
import '../widgets/listview_ builder_fav.dart';
import '../widgets/listview_builder.dart';
import '../widgets/listview_builderTrash.dart';

class TrashPage extends StatefulWidget {
  static String routeName = '/trash';

  @override
  State<TrashPage> createState() => _TrashPageState();
}

class _TrashPageState extends State<TrashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Trash', style: TextStyle(fontFamily: "Caladea", fontSize: 26),),
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
            child: ListViewBuilderTrash() //uses list view builder widget
        ),
        drawer: AppDrawer() //navigate between pages via app drawer
    );
  }
}
