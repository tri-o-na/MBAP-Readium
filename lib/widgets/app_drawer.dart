import 'package:flutter/material.dart';
import 'package:readium_v1/main.dart';
import 'package:readium_v1/screens/about_book_screen.dart';
import 'package:readium_v1/screens/account_details.dart';
import 'package:readium_v1/screens/trash_page.dart';

import '../screens/authors.dart';
import '../screens/books_page.dart';
import '../screens/favourites_page.dart';
import '../screens/have_read_page.dart';
import '../screens/reading_now.dart';
import '../screens/series.dart';
import '../screens/to_be_read_page.dart';

class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFeddcd2),
      child: Column(children: [
        AppBar(
          title: Text("Readium", style: TextStyle(
          fontSize: 25,
          fontFamily: "Caladea",
          color: Color(0xFFfff1e6),
          fontWeight: FontWeight.bold)),
          // automaticallyImplyLeading: false,
          leading: Image.asset('images/logo_v1.2.jpg'),
          backgroundColor: Color(0xffDDBEA9),
        ),
        ListTile( //list tile to navigate to reading now page
          minLeadingWidth: 35,
          leading: Icon(Icons.repeat, color: Color(0xffa5a58d), ),
          title: Text('Reading Now', style: TextStyle(color: Color(0xFFcb997e),
              fontFamily: "Caladea", fontSize: 20),),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(ReadingNow.routeName),
        ),
        Divider(height: 1, color: Color(0xffCB997E)),

        ListTile( //list tile to navigate to books page
          minLeadingWidth: 35,
          leading: Icon(Icons.menu_book, color: Color(0xffa5a58d)),
          title: Text('Books', style: TextStyle(color: Color(0xFFcb997e),
              fontFamily: "Caladea", fontSize: 20),),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(BooksPage.routeName),
        ),
        Divider(height: 1, color: Color(0xffcb997e)),

        ListTile(  //list tile to navigate to favourites
          minLeadingWidth: 35,
          leading: Icon(Icons.star_border, color: Color(0xffa5a58d)),
          title: Text('Favourites', style: TextStyle(color: Color(0xFFcb997e),
              fontFamily: "Caladea", fontSize: 20),),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(FavouritesPage.routeName),
        ),
        Divider(height: 1, color: Color(0xffCB997E)),

        ListTile(  //list tile to navigate to to be read page
          minLeadingWidth: 35,
          leading: Icon(Icons.access_time, color: Color(0xffa5a58d)),
          title: Text('To Be Read', style: TextStyle(color: Color(0xFFcb997e),
              fontFamily: "Caladea", fontSize: 20),),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(TBRPage.routeName),
        ),
        Divider(height: 1, color: Color(0xffCB997E)),

        ListTile( //list tile to navigate to have read page
          minLeadingWidth: 35,
          leading: Icon(Icons.done_all, color: Color(0xffa5a58d)),
          title: Text('Have Read', style: TextStyle(color: Color(0xFFcb997e),
          fontFamily: "Caladea", fontSize: 20)),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(HaveReadPage.routeName),
        ),
        Divider(height: 1, color: Color(0xffCB997E)),

        ListTile(  //list tile to navigate to trash page
          minLeadingWidth: 35,
          leading: Icon(Icons.delete, color: Color(0xffa5a58d)),
          title: Text('Trash', style: TextStyle(color: Color(0xFFcb997e),
          fontFamily: "Caladea", fontSize: 20)),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(TrashPage.routeName),
        ),
        Divider(height: 1, color: Color(0xffCB997E)),

        ListTile(  //list tile to navigate to authors page
          minLeadingWidth: 35,
          leading: Icon(Icons.person, color: Color(0xffa5a58d)),
          title: Text('Authors', style: TextStyle(color: Color(0xFFcb997e),
          fontFamily: "Caladea", fontSize: 20)),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(Authors.routeName),
        ),
        Divider(height: 1, color: Color(0xffCB997E)),

        ListTile( //list tile to navigate to series page
          minLeadingWidth: 35,
          leading: Icon(Icons.discount, color: Color(0xffa5a58d)),
          title: Text('Series', style: TextStyle(color: Color(0xFFcb997e),
          fontFamily: "Caladea", fontSize: 20)),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(Series.routeName),
        ),
        Divider(height: 1, color: Color(0xffCB997E)),

        ListTile(  //list tile to navigate to account details page
          minLeadingWidth: 35,
          leading: CircleAvatar(
            foregroundImage: AssetImage('images/default3.jpg'),
            maxRadius: 15
          ),
          title: Text('Account', style: TextStyle(color: Color(0xFFcb997e),
              fontFamily: "Caladea", fontSize: 20)),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(AccountDetails.routeName),
        ),
        Divider(height: 1, color: Color(0xffCB997E)),
      ]),
    );
  }
}
