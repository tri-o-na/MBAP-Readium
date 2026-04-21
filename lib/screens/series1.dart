import 'package:flutter/material.dart';
import 'package:readium_v1/widgets/listview_builder_1series.dart';


class Series1 extends StatelessWidget {
  static String routeName = '/series1';


  @override
  Widget build(BuildContext context) {
    String seriesName = ModalRoute.of(context)?.settings.arguments as String; //extract argument from series page
    return Scaffold(
      appBar: AppBar(
        title: Text(
          seriesName,
          style: TextStyle(fontFamily: "Caladea", fontSize: 26),
        ),
        backgroundColor: Color(0xFFddbea9),
      ),
      body: Container(
          color: Color(0xFFfff1e6),
          padding: EdgeInsets.only(top: 10),
          child: ListViewBuilder1Series(seriesName) //uses list view builder widget, passing through the seriesName
      ),
    );
  }
}
