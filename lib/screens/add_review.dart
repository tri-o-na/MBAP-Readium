import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../models/review.dart';
import '../providers/review_list.dart';

class AddReview extends StatefulWidget {
  static String routeName = '/addReview';


  @override
  State<AddReview> createState() => _AddReviewState();
}


class _AddReviewState extends State<AddReview> {
  List <Review> myReviews = [];
  void removeItem(i) {
    setState(() {
      myReviews.removeAt(i);
    });
  }

  var form = GlobalKey<FormState>();

  String? review;
  int? rating;
  String? bookName1;
  // bookName1 = bookName;

  void saveForm(ReviewList reviewList) { //add a review function
    bool isValid = form.currentState!.validate();

    if (isValid) {
      form.currentState!.save();
      // if (travelDate == null) travelDate = DateTime.now();
      //  print(review);
      // myReviews.insert(0, Review(review: review!, rating : rating!));

      reviewList.addReview(review, rating, bookName1);

      // Hide the keyboard
      if ( FocusScope.of (context).hasFocus){
      FocusScope.of (context).unfocus();
    }
      // Resets the form
      form.currentState!.reset();
      // travelDate = null;
      // Shows a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
      Text('Review added successfully!'),));
    }
  }

  // void presentDatePicker(BuildContext context) {
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime.now(),
  //   ).then((value) {
  //     if (value == null) return;
  //     setState(() {
  //       travelDate = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    ReviewList reviewList = Provider.of<ReviewList>(context);
    String bookName = ModalRoute.of(context)?.settings.arguments as String; //calls bookName in reviewList
    return Scaffold(
        appBar: AppBar(
          title: Text(
            bookName,
            style: TextStyle(fontFamily: "Caladea", fontSize: 26),
          ),
          backgroundColor: Color(0xFFddbea9),
          actions: [
            IconButton(onPressed: () {
              bookName1 = bookName; //bookName in book list = book name in review list
              saveForm(reviewList); //click save icon to save review
            }, icon: Icon(Icons.save))
          ],
        ),
        body: Container(
          color: Color(0xFFfff1e6),
          padding: EdgeInsets.all(10),
          child: Form(
            key: form, //creating a form
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  cursorColor: Color(0xffA5A58D),
                  style: TextStyle(fontFamily: "Caladea",
                    fontSize: 21, color: Color(0xffCB997E),),
                  decoration: InputDecoration(label: Text('Review'),
                    labelStyle: TextStyle(fontFamily: "Caladea",
                    fontSize: 20, color: Color(0xffCB997E),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffA5A58D)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffA5A58D)),
                    ),

                  ),
                  onSaved: (value) { review = value; },
                  validator: (value) { //validator so that user will provide a valid review
                    if (value == null)
                      return "Please provide a review.";
                    else if (value.length < 5)
                      return 'Please enter a review that is at least 5 characters.';
                    else
                      return null;
                  }
                ),
                SizedBox(height: 10,),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    label: Text('Rating'),labelStyle: TextStyle(fontFamily: "Caladea",
                    fontSize: 22, color: Color(0xffCB997E), //label style
                      ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffA5A58D)),
                    ),
                  ),
                  iconEnabledColor: Color(0xffA5A58D),
                  iconDisabledColor: Color(0xffb7b7a4),
                  items: [ //drop down menu
                    DropdownMenuItem(child: Text('1'), value: 1),
                    DropdownMenuItem(child: Text('2'), value: 2),
                    DropdownMenuItem(child: Text('3'), value: 3),
                    DropdownMenuItem(child: Text('4'), value: 4),
                    DropdownMenuItem(child: Text('5'), value: 5),
                  ],
                  onChanged: (value) { rating = value as int; },
                  validator: (value) { //validator so that user will provide a valid rating
                    if (value == null)
                      return "Please provide a rating.";
                    else
                      return null;
                  },
                  style: TextStyle(  //te
                      color: Color(0xffCB997E), //Font color
                      fontSize: 20, //font size on dropdown button
                      fontFamily: "Lucida Bright"
                  ),
                  dropdownColor: Color(0xFFfff1e6),
                ),

              ],
            ),
          ),
        // )
    ));
  }
}