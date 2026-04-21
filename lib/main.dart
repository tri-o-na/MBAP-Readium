import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readium_v1/providers/book_list.dart';
import 'package:readium_v1/providers/review_list.dart';
import 'package:readium_v1/screens/account_details.dart';
import 'package:readium_v1/screens/add_review.dart';
import 'package:readium_v1/screens/auth_screen.dart';
import 'package:readium_v1/screens/author1.dart';
import 'package:readium_v1/screens/authors.dart';
import 'package:readium_v1/screens/books_page.dart';
import 'package:readium_v1/screens/edit_review.dart';
import 'package:readium_v1/screens/favourites_page.dart';
import 'package:readium_v1/screens/have_read_page.dart';
import 'package:readium_v1/screens/reading_now.dart';
import 'package:readium_v1/screens/series.dart';
import 'package:readium_v1/screens/series1.dart';
import 'package:readium_v1/screens/to_be_read_page.dart';
import 'package:readium_v1/screens/trash_page.dart';
import 'package:readium_v1/services/auth_service.dart';
import 'package:readium_v1/widgets/login_form.dart';
import 'package:readium_v1/widgets/register_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ReviewList>(
          create: (ctx) => ReviewList(),
        ),
      ],
      child: FutureBuilder(
        future: Firebase.initializeApp(),
    builder: (ctx, snapshot) => snapshot.connectionState ==
        ConnectionState.waiting ?
    Center(child: CircularProgressIndicator()) :
    StreamBuilder<User?>(
    stream: authService.getAuthUser(),
      builder: (context, snapshot) {
        return MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: MainScreen(),
        routes: { //routes to navigate to different pages
                  ReadingNow.routeName  : (_) { return ReadingNow(); },
                  BooksPage.routeName : (_) { return BooksPage(); },
                  FavouritesPage.routeName : (_) { return FavouritesPage(); },
                  TBRPage.routeName : (_) { return TBRPage(); },
                  HaveReadPage.routeName : (_) { return HaveReadPage(); },
                  TrashPage.routeName : (_) { return TrashPage(); },
                  Authors.routeName : (_) { return Authors(); },
                  Author1.routeName : (_) { return Author1(); },
                  Series.routeName : (_) { return Series(); },
                  Series1.routeName : (_) { return Series1(); },
                  AccountDetails.routeName : (_) { return AccountDetails(); },
                  EditReview.routeName : (_) { return EditReview(); },
                  AddReview.routeName : (_) { return AddReview(); },
                  AuthScreen.routeName : (_) { return AuthScreen(); },

                },
            );
      }
    ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  AuthService authService = AuthService();


  static String routeName = '/main';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream:  authService.getAuthUser(),
      builder: (context, snapshot) {
        return Scaffold(
            body: Container(
              color: Color(0xFFFFF1E6),
              padding: EdgeInsets.all(50),
              child: Column(children: [
                SizedBox(height: 100),
                Text('Welcome to',
                    style: TextStyle(
                        fontSize: 38,
                        fontFamily: "Caladea",
                        color: Color(0xFFddbea9),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Image.asset('images/logo_v1.1.jpg', width: 200,),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () => {

                    snapshot.connectionState == ConnectionState.waiting ?
                    Center(child: CircularProgressIndicator()) :
                    snapshot.hasData ?
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReadingNow()),) :
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AuthScreen()),),

                    //when the button is pressed, navigate to reading now page

                  },
                  child: Text('LOGIN', style: TextStyle(fontWeight: FontWeight.bold,
                      fontFamily: "Lucida Bright", fontSize: 20, color: Color(0xFFFFF1E6),
                      letterSpacing: 8.0)),
                  style:
                  ElevatedButton.styleFrom(
                      shape: StadiumBorder(side: BorderSide(width: 1, color: Color(0xffA5A58D))),
                      minimumSize: Size(305, 47),
                      primary: Color(0xFFddbea9)
                  )
                ),
                SizedBox(height: 10),
                Text('OR',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Lucida Bright",
                        color: Color(0xffA5A58D),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                ElevatedButton( //when the button is pressed, navigate to reading now page
                    onPressed: () => {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AuthScreen()),)},
                    child: Text('SIGN UP', style: TextStyle(fontWeight: FontWeight.bold,
                        fontFamily: "Lucida Bright", fontSize: 20, color: Color(0xFFFFF1E6),
                        letterSpacing: 8.0)),
                    style:
                    ElevatedButton.styleFrom(
                        shape: StadiumBorder(side: BorderSide(width: 1, color: Color(0xffA5A58D))),
                        minimumSize: Size(305, 47),
                        primary: Color(0xFFddbea9)
                    )),
              ]),
            )
        );
      }
    );
  }
}
