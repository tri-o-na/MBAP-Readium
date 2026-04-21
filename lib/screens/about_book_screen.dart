

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:readium_v1/screens/add_review.dart';
import 'package:readium_v1/screens/edit_book_details.dart';
import 'package:readium_v1/screens/reading_now.dart';
import 'package:readium_v1/widgets/app_drawer.dart';
import 'package:readium_v1/widgets/reviews_list.dart';

import '../models/book.dart';
import '../models/review.dart';
import '../providers/review_list.dart';
import '../widgets/listview_builder.dart';

class AboutBook extends StatefulWidget {
  static String routeName = '/aboutbook';
  final Book book;

  AboutBook(this.book);

  @override
  State<AboutBook> createState() => _AboutBookState();
}

class _AboutBookState extends State<AboutBook> {
  bool click = true;
  bool click2 = true;
  bool click3 = true;
  bool click4 = true;
  bool click5 = true; //clicks of the icon buttons

  List <Review> myReviews = [];
  void removeItem(i) {
    setState(() {
      myReviews.removeAt(i);
    });
  }


  @override
  Widget build(BuildContext context) {
    ReviewList reviewList = Provider.of<ReviewList>(context);
    return Scaffold(
        appBar: AppBar( //top bar decoration and text
          leadingWidth: 25,
          title: Text("About "+ widget.book.bookName , style: TextStyle(fontFamily: "Caladea", fontSize: 26),),
          backgroundColor: Color(0xFFddbea9),
        ),
        body: SingleChildScrollView( //allows the page to be scrollable
          child: Container(
              color: Color(0xFFfff1e6),
              padding: EdgeInsets.fromLTRB(20, 14, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(widget.book.imageUrl, height: 365,),
                  SizedBox(height:10),
                  Text(widget.book.bookName, style:
                  TextStyle(color: Color(0xffcb997e), fontFamily: "Lucida Bright",
                      fontSize: 26, ),),
                  Row(
                      children: [
                        IconButton(onPressed: () {setState((){
                          if (widget.book.favourite == 0){
                            widget.book.favourite = 1;
                          } //when the icon is clicked, the value of favourite changes from 0 to 1, if it is 0
                          else {widget.book.favourite = 0;} //if it is not 0, the value of favourite will revert back to 0
                          });},
                            icon: Icon((widget.book.favourite == 0) ? Icons.star_border: Icons.star,
                              //when the value of favourite is 0, it will show the 1st icon, if  not, it will show the 2nd icon
                              color: Color(0xffa5a58d), size: 25, ),
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                        ),
                        IconButton(onPressed: () {setState(() {
                          if (widget.book.toBeRead == 0){
                          widget.book.toBeRead = 1;
                        }//when the icon is clicked, the value of toBeRead changes from 0 to 1, if it is 0
                        else {widget.book.toBeRead = 0;}
                        });}, //if it is not 0, the value will revert back to 0
                            icon: Icon((widget.book.toBeRead == 1) ? Icons.access_time_filled: Icons.access_time,
                              //when the value of toBeRead is 1, it will show the 1st icon, if  not, it will show the 2nd icon
                              color: Color(0xffa5a58d), size: 25,
                            ),
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                        ),
                        IconButton(onPressed: () {setState(() {
                          if (widget.book.haveRead == 0){
                            widget.book.haveRead = 1;
                          } //when the icon is clicked, the value of haveRead changes from 0 to 1, if it is 0
                          else {widget.book.haveRead = 0;}
                        });}, //if it is not 0, the value will revert back to 0
                            icon: Icon((widget.book.haveRead == 1) ? Icons.done_all: Icons.check,
                              //when the value of haveRead is 1, it will show the 1st icon, if  not, it will show the 2nd icon
                              color: Color(0xffa5a58d), size: 25, ),
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                        ),
                        IconButton(onPressed: () {setState(() {
                          if (widget.book.trash == 0){
                            widget.book.trash = 1;
                          }//when the icon is clicked, the value of haveRead changes from 0 to 1, if it is 0
                          else {widget.book.trash = 0;}
                        });},//if it is not 0, the value will revert back to 0
                            icon: Icon((widget.book.trash == 1) ? Icons.delete: Icons.delete_outline_outlined,
                              //when the value of trash is 1, it will show the 1st icon, if  not, it will show the 2nd icon
                              color: Color(0xffa5a58d), size: 25, ),
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                        ),
                        // IconButton(onPressed: () {setState(()
                        // {Navigator.push(context, MaterialPageRoute(builder: (context) => EditBookDetails(widget.book)));}
                        // );},
                        //     icon: Icon(Icons.edit,
                        //       color: Color(0xffa5a58d), size: 25, ),
                        //   alignment: Alignment.topLeft,
                        //   padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                        // ),
                      ]
                  ),
                  // this next part prints the values of the book, and the name below it
                  Text(widget.book.authorName, style:
                  TextStyle(color: Color(0xffcb997e), fontFamily: "Lucida Bright",
                      fontSize: 16),),
                  Text("Author", style:
                  TextStyle(color: Color(0xffBCB9A4), fontFamily: "Caladea",
                      fontSize: 13),),
                  SizedBox(height:12),
                  Text(widget.book.seriesName+' #'+widget.book.seriesNo.toString(), style:
                  TextStyle(color: Color(0xffcb997e), fontFamily: "Lucida Bright",
                      fontSize: 16),),
                  Text("Series", style:
                  TextStyle(color: Color(0xffBCB9A4), fontFamily: "Caladea",
                      fontSize: 13),),
                  SizedBox(height:12),
                  SizedBox(
                    width: 355,
                    child: Text(widget.book.description, style:
                    TextStyle(color: Color(0xffcb997e), fontFamily: "Lucida Bright",
                        fontSize: 16), ),
                  ),
                  Text("Description", style:
                  TextStyle(color: Color(0xffBCB9A4), fontFamily: "Caladea",
                      fontSize: 13),),
                  SizedBox(height:12),
                  Text(widget.book.language, style:
                  TextStyle(color: Color(0xffcb997e), fontFamily: "Lucida Bright",
                      fontSize: 16),),
                  Text("Language", style:
                  TextStyle(color: Color(0xffBCB9A4), fontFamily: "Caladea",
                      fontSize: 13),),
                  SizedBox(height:12),
                  Text(DateFormat('dd/MM/yyyy').format(widget.book.dateTimeAdded), style:
                  TextStyle(color: Color(0xffcb997e), fontFamily: "Lucida Bright",
                      fontSize: 16),),
                  Text("Last Read Time", style:
                  TextStyle(color: Color(0xffBCB9A4), fontFamily: "Caladea",
                      fontSize: 13),),
                  SizedBox(height:15),
                  //this next part is the reviews
                  Row(
                    children: [
                      Text("Reviews:", style:
                      TextStyle(color: Color(0xffcb997e), fontFamily: "Lucida Bright",
                          fontSize: 20),),
                      IconButton(
                        onPressed: () {setState(()
                        {Navigator.of(context).pushNamed(AddReview.routeName, arguments: widget.book.bookName);}
                        );},//to add review, this button is clicked which navigates the user to the AddReview page
                      icon: Icon(Icons.add,
                        color: Color(0xffa5a58d), size: 25, ),
                      ),
                    ],
                  ),
                  Container(
                      height: 200,
                      alignment: Alignment.center, //this next line prints all the reviews that were added
                      child: reviewList.getMyReviews().length > 0 ? ReviewsList(myReviews, removeItem, widget.book.bookName) :
                      Column(
                        children: [
                          // Image.asset('images/empty.png', width: 300),
                          Text('No reviews yet, add a review now!', //no reviews were added
                            style:TextStyle(color: Color(0xffcb997e),
                                fontFamily: "Caladea", fontSize: 18),),
                          Container( //some reviews were added
                              child: ReviewsList(myReviews, removeItem, widget.book.bookName),
                              ),
                        ],
                      )
                  ),

                ],
              ),
            ),
        ),
    );
  }
}

// Future openDialog() => showDialog(
//     context: null,
//     builder: (context) => AlertDialog(
//       title: Text('Your Review'),
//       content: TextField(
//         autofocus: true,
//         decoration: InputDecoration(hintText: 'Enter your review'),
//       ),
//       actions: [
//         TextButton(onPressed: submit, child: Text('SUBMIT'))
//       ],
//
// ),
//   );
// void submit() {
//   Navigator.of(context).pop();
// }
