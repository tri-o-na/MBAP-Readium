import 'package:flutter/material.dart';
import 'package:readium_v1/widgets/app_drawer.dart';
import 'package:readium_v1/widgets/listview_builder3.dart';

class Series extends StatelessWidget {
  static String routeName = '/series';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Series',
          style: TextStyle(fontFamily: "Caladea", fontSize: 26),
        ),
        backgroundColor: Color(0xFFddbea9),
      ),
      body: Container(
          color: Color(0xFFfff1e6),
          padding: EdgeInsets.only(top: 10),
          child: ListViewBuilder3() //uses list view builder widget
      ),
      drawer: AppDrawer(), //navigate between pages via app drawer
    );
  }
}
