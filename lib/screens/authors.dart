import 'package:flutter/material.dart';
import 'package:readium_v1/widgets/listview_builder2.dart';

import '../widgets/app_drawer.dart';

class Authors extends StatelessWidget {
  static String routeName = '/authors';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Authors',
          style: TextStyle(fontFamily: "Caladea", fontSize: 26),
        ),
        backgroundColor: Color(0xFFddbea9),
      ),
      body: Container(
          color: Color(0xFFfff1e6),
          padding: EdgeInsets.only(top: 10),
          child: ListViewBuilder2() //uses list view builder widget
      ),
      drawer: AppDrawer(), //navigate between pages via app drawer
    );
  }
}
